import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:face_net_authentication/router/route_constants.dart';
import 'package:face_net_authentication/utils/snackbar_utils.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/pages/widgets/FacePainter.dart';
import 'package:face_net_authentication/pages/widgets/auth-action-button.dart';
import 'package:face_net_authentication/pages/widgets/camera_header.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:face_net_authentication/services/ml_service.dart';

class SignUpSelfie extends StatefulWidget {
  final bool isSignup;
  const SignUpSelfie({Key? key, required this.isSignup}) : super(key: key);

  @override
  SignUpSelfieState createState() => SignUpSelfieState();
}

class SignUpSelfieState extends State<SignUpSelfie> {

  final AuthController signInController =
  GetControllers.shared.getSignInController();


  String? imagePath;
  Face? faceDetected;
  Size? imageSize;

  bool _detectingFaces = false;
  bool pictureTaken = false;

  bool _initializing = false;

  bool _saving = false;
  bool _bottomSheetVisible = false;

  // service injection
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  MLService _mlService = locator<MLService>();

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    timer!.cancel();
    _cameraService.dispose();
    super.dispose();
  }

  _start() async {
    setState(() => _initializing = true);
    await _cameraService.initialize();
    setState(() => _initializing = false);

    _frameFaces();
  }

  Future<bool> onShot() async {
    if (faceDetected == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('No face detected!'),
          );
        },
      );

      return false;
    } else {
      _saving = true;
      await Future.delayed(Duration(milliseconds: 500));
      // await _cameraService.cameraController?.stopImageStream();
      await Future.delayed(Duration(milliseconds: 200));
      XFile? file = await _cameraService.takePicture();
      imagePath = file?.path;

      setState(() {
        _bottomSheetVisible = true;
        pictureTaken = true;
      });

      return true;
    }
  }

  _frameFaces() {
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController?.startImageStream((image) async {
      if (_cameraService.cameraController != null) {
        if (_detectingFaces) return;

        _detectingFaces = true;

        try {
          await _faceDetectorService.detectFacesFromImage(image);

          if (_faceDetectorService.faces.isNotEmpty) {
            setState(() {
              faceDetected = _faceDetectorService.faces[0];
            });
            if (_saving) {
              timer!.cancel();

              if(widget.isSignup) {
                debugPrint("====_saving=====" + _saving.toString());
                _mlService.setCurrentPrediction(image, faceDetected);
                signInController.localPredictedData.value =
                    _mlService.predictedData;
                signInController.localImage.value = _cameraService.imagePath!;
                Get.back();
              }else{

                List<double> remoteData = (jsonDecode("[-0.003638617228716612,0.009085646830499172,0.0008643228211440146,-0.002717419061809778,-0.006187484599649906,0.02576136589050293,0.17477990686893463,0.19980184733867645,-0.2165614813566208,0.1412181705236435,0.0008017898071557283,0.0034994790330529213,-0.0013613776536658406,-0.0003047589270863682,-0.0017706163926050067,-0.13147395849227905,-0.010279725305736065,0.0059637343510985374,0.005430278833955526,-0.009614058770239353,0.12173578888177872,0.026966027915477753,-0.06885537505149841,-0.002382557839155197,0.021068207919597626,0.00422664126381278,0.0005909722531214356,0.04609185829758644,0.13847671449184418,0.0859920084476471,0.006618806626647711,0.07000572234392166,0.04625379294157028,0.0009258918580599129,-0.16013282537460327,0.1498304009437561,-0.25091782212257385,0.013871891424059868,-0.013220377266407013,0.16950272023677826,-0.005845408421009779,-0.0015837920363992453,-0.006105412729084492,-0.005473496858030558,0.010684667155146599,0.00996209867298603,-0.059581607580184937,0.12853483855724335,0.002889317460358143,0.04494526982307434,-0.08226241916418076,-0.0013157554203644395,-0.08601895719766617,0.0017796603497117758,0.0963054969906807,0.0016662796260789037,0.009291606023907661,-0.0007020393968559802,-0.0021197593305259943,-0.011963842436671257,0.029757754877209663,-0.03206421062350273,0.0011572176590561867,0.08006554841995239,0.017942005768418312,-0.19793769717216492,-0.0013191818725317717,-0.04452000930905342,0.00029857095796614885,-0.005985949654132128,-0.002606698079034686,-0.23760776221752167,0.009948060847818851,0.015040738508105278,-0.0838952288031578,0.007408127188682556,-0.00804926734417677,0.0010645551374182105,-0.1563592553138733,-0.019978955388069153,0.015513559803366661,0.009238292463123798,-0.0027594154234975576,0.13294154405593872,0.06204991415143013,0.0023131573107093573,0.003988413140177727,0.10806000977754593,-0.042346544563770294,0.029871968552470207,0.008029920049011707,0.0032482496462762356,-0.004369113594293594,0.017647886648774147,-0.30064767599105835,-0.03324815258383751,-0.05024486780166626,0.025089824572205544,0.0022011857945472,0.01591195911169052,-0.0006464498001150787,0.008772936649620533,-0.003794541349634528,0.00038379753823392093,-0.0022076459135860205,0.004350527189671993,0.003926028031855822,-0.00019174163753632456,0.005047427956014872,0.004688804037868977,0.14658454060554504,0.0014953024219721556,-0.0010601307731121778,0.09964416921138763,0.006498799659311771,-0.05442962422966957,0.004487345460802317,-0.04170920327305794,0.003847083542495966,-0.13394980132579803,-0.06507215648889542,-0.016773685812950134,0.18591006100177765,0.0011519559193402529,0.0014148830669000745,0.004307935945689678,0.009171144105494022,0.0007153073674999177,0.003984413109719753,0.108848437666893,-0.0014120013220235705,-0.004443584941327572,0.0009221920045092702,0.059323593974113464,0.05919167026877403,-0.0069318111054599285,-0.12522868812084198,-0.03048078902065754,-0.015986192971467972,-0.0012238851049914956,-0.006502952426671982,-0.003466307418420911,0.0008516998495906591,-0.21577173471450806,0.02069847658276558,-0.11747439205646515,0.004530609585344791,0.009275030344724655,0.007541611324995756,0.008826707489788532,0.011533986777067184,-0.03349471837282181,0.042284414172172546,0.005529290996491909,0.0020819318015128374,0.0027125489432364702,0.018675634637475014,-0.0010764376493170857,-0.016570117324590683,-0.00219117384403944,0.014605327509343624,0.001274086069315672,0.001378590357489884,-0.006260129623115063,-0.0034603269305080175,0.0057609411887824535,0.00949633028358221,0.04985286295413971,0.001740834559313953,-0.000913865165784955,-0.024489108473062515,-0.09972862899303436,0.001473761978559196,0.0036108563654124737,-0.024662937968969345,-0.004190234467387199,-0.06533973664045334,0.0020670725498348475,-0.0027657048776745796,-0.008080153726041317,-0.11687415093183517,-0.010285464115440845,0.01148658525198698,-0.006807866971939802,-0.1784137338399887,-0.219704732298851,0.11313915252685547,0.01491477433592081,-0.04809046909213066,-0.0966809019446373,-0.008058871142566204,0.001414220780134201]") as List<dynamic>).cast<double>();
                debugPrint("remoteData Size::"+remoteData.length.toString());

                //_mlService.searchResultFromRemote(_mlService.predictedData, signInController.responseCheckUser.value.imgData);
                bool isFaceMatched = _mlService.searchResultFromRemote(_mlService.predictedData, remoteData);

                debugPrint("=========isFaceMatched====="+remoteData.length.toString());

                if(isFaceMatched){
                  ToastUtils.showSuccess("Login Successful");
                  Get.offAllNamed(dashboard);
                }else{
                  ToastUtils.showSuccess("Face not matched! Try again");
                  Get.back();
                }

              }

              debugPrint("====localPredictedData=====" +
                  signInController.localPredictedData.value.length
                      .toString());
              debugPrint(
                  "====localImage=====" + signInController.localImage.value);


              setState(() {
                _saving = false;
              });
            }
          } else {
            setState(() {
              faceDetected = null;
            });
          }

          _detectingFaces = false;
        } catch (e) {
          print(e);
          _detectingFaces = false;
        }
      }
    });

    timer = Timer(Duration(seconds: 2), (){
      debugPrint("=========onShot=========");
      onShot();
    });
  }

  Timer? timer;

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  _reload() {
    setState(() {
      _bottomSheetVisible = false;
      pictureTaken = false;
    });
    this._start();
  }

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    late Widget body;
    if (_initializing) {
      body = Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_initializing && pictureTaken) {
      body = Container(
        width: width,
        height: height,
        child: Transform(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.file(File(imagePath!)),
            ),
            transform: Matrix4.rotationY(mirror)),
      );
    }

    if (!_initializing && !pictureTaken) {
      body = Transform.scale(
        scale: 1.0,
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: width,
                height:
                    width * _cameraService.cameraController!.value.aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CameraPreview(_cameraService.cameraController!),
                    CustomPaint(
                      painter: FacePainter(
                          face: faceDetected, imageSize: imageSize!),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: Stack(
          children: [
            body,
            CameraHeader(
              "Selfie",
              onBackPressed: _onBackPressed,
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: !_bottomSheetVisible
            ? AuthActionButton(
                onPressed: onShot,
                isLogin: false,
                reload: _reload,
              )
            : Container());
  }
}
