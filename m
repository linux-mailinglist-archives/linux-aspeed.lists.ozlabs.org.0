Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232582E83A
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jan 2024 04:27:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=GNwfxIOK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDZG03G5mz3btZ
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Jan 2024 14:27:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72a; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDZFb3NTVz3bXv
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Jan 2024 14:27:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0McGYmicZUc2ylPR4cinID7aZi3hRcIuHb4HTHKoydIruRs1YgRhCWhUiP06hF1ACe8dzU3CKP/60szXACmkZ3YkRfhC9PsgtZDwXBN+fAsoZZVsT4JUDb/ReS34Able9IJM5BFAEa5Fw0gdhM9/G3dVbB4Pe1ITUOhGjh9eS7h/sM3hagpI6lE8Y1l/QQ4SDLKBm8uSDS1D149cedkKNFH6WFzkLdNsQGMiURcLyUQ2xBGPsKRnX3DOHrpznLIoHDcUoIdR81OLZ8U3iilRH76t4xEEMcZrGfKVvcyONhB+qIe5bo46ifvYtkmPiA2gdR7/Xh/YEllktrn7SZgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AB/UIKajGKhyCkanyKdU+bx3DrAHiicmMJi4QCuHaRc=;
 b=Hjp9OvpbuQsiw1iZ6rFKVbMFLmqWovWcK9PU67A6VxC7Y3Ax0dEOAtFN3v9Cxo0qNIAotNbwySdw4pSMiwzRxzfg2kOj/RcK1VzU9uNDmsIQjEGdxDq9cVTc/zqZ8sFJZFqUeDJJ/WbcSh2N3we5685VMbEHluZ+LG9mcQz5ls/wQFkSgDgbhgCiIeeWIDw0C7WE4e/iPVQFnjBgeqx52SYA7iwW0ydFmz+iV70xbcR5x0b+XXPrPbOdE0bbW3UAW/3uyBZXRz/mMwssN7jxWdoDGVZu40mPQhIIMCMAwEkF7OERlrTTSEtB4QgMVfgyo9aZz2VyyxLdNL4jIg8qdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB/UIKajGKhyCkanyKdU+bx3DrAHiicmMJi4QCuHaRc=;
 b=GNwfxIOK1iL3LkUk5VAPc+l7JBLdZL9JL0emJ4lu9/9kd8lG07eSCW7nSIE67aPm6CmG2reWwAEc4fY047wUNshpMv7zoxuFK5MSyozxiqaeyxf5VKHN9u7FbfdoXtH/k547nN3j0g8YGgYknGQR16dyGCarrOWLnLIncYzg5y9MFhKT3DZSUs3MooiUyNsRM5ezdHRr5VvYCrRDEe5kEtF5EAe2ETP34EMhimMRlvABrV19h9X78iuygLkjPLPSZA28zIGsu/BqjGlRIg4Y2O5t2R0DEGGZ7GSd5PaxJbDNnAgEYKGzDF9NvH4Eq2fvyitudfkD4yMzCAPRMTcu9g==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by OSQPR06MB7153.apcprd06.prod.outlook.com (2603:1096:604:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 03:10:00 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::36df:4bd:1991:976b]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::36df:4bd:1991:976b%5]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 03:09:59 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"corbet@lwn.net" <corbet@lwn.net>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "u.kleine-koenig@pengutronix.de"
	<u.kleine-koenig@pengutronix.de>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"patrick@stwcx.xyz" <patrick@stwcx.xyz>
Subject: Re: [PATCH v12 1/3] dt-bindings: hwmon: fan: Add fan binding to
 schema
Thread-Topic: [PATCH v12 1/3] dt-bindings: hwmon: fan: Add fan binding to
 schema
Thread-Index: AQHaQgZu5E6zHIhZfEy632aEYqumvLDapZqAgAEmR1s=
Date: Tue, 16 Jan 2024 03:09:59 +0000
Message-ID:  <OSQPR06MB72520F546A22DE55532A33E78B732@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240108074348.735014-1-billy_tsai@aspeedtech.com>
 <20240108074348.735014-2-billy_tsai@aspeedtech.com>
 <54929342-7e06-4e39-a7e9-e5dc787406ce@linaro.org>
In-Reply-To: <54929342-7e06-4e39-a7e9-e5dc787406ce@linaro.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|OSQPR06MB7153:EE_
x-ms-office365-filtering-correlation-id: b3d79ad6-a9b7-4746-2096-08dc1640a010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3mXcEnYPgpcmqgiUtrRwGPQx4k2lKgXVASAiuwWM2+oTqIJQFCesvj6BcNn6iOhT3aaK/QTj9DF4DY17pjMZjZAjvcHwSvMciCnMa3mODu4lz5JKzhgBVVBSsgwyMnba7E5aWDbe/qRCw7w4jDHcQbs9XBFDniU9lIrX4yNi8wrzTMz8N5dIBDqZCqvMVtO5/tmFIlzVIkJvDufUVOt7/w7QP0rGoDS/IlZl7057/ujK9HKcyZTPjJvmSo3pv60pOnW/hQwVFItlxg3qumZsOd3Ss7T+NtncEMSSV/bv3V8+fCV2S9GosQv57v4KTF/ueoGs5sdpBvZF982dQgXqlVK+7gEXB6dI1HLu2SMa54s5mk34vCDXetzA0e1w7mpbzTwlRC4cwy+EAeQipVbfC1K/auk7QY3whZBoou4lsXtT4bvghVPGzYwFY4h48MYkMiDCuTrz7RYXLYHLYbnpnuaIo6zyO3AQZZmS5B3Xi14BI2P3FWED2i4QMYK6Q/1w6xURoWu4cfJ25OlQhFa1YtKvaw+0DAg0U3xQL+gm76+YqsvsdHuFy38353FhOmRGzvtW645McBknTj5kv31m1gbOgZ8kA0maMZTwgMkYZVlfs0bPiXJcuz1IHq+v2mLM
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39850400004)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(122000001)(38070700009)(38100700002)(55016003)(26005)(86362001)(33656002)(921011)(76116006)(9686003)(71200400001)(7696005)(66946007)(66556008)(66476007)(66446008)(110136005)(6506007)(55236004)(64756008)(316002)(7416002)(5660300002)(52536014)(8936002)(8676002)(2906002)(4744005)(41300700001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?xkhvC97KVRpdSM/sJjVrrj4RJlBhDGzGLnI33Al7oT+KRRpPn+cA6Bum5w?=
 =?iso-8859-1?Q?n1vxs4hRYm+igJke1Fai+tOt0PEA7DYGUexmSaOx9avmokD/WQLxen31Ko?=
 =?iso-8859-1?Q?VGu8jUbcSl+lqNmO5r+FOebbV0km50TyGvi7Oo+xNB3+E5yDr3Byr9Hs8z?=
 =?iso-8859-1?Q?P8AbSlY7GAXAZ1bQsaRvNWy4T30fVeO2zrFe1QFisDTkfj02iBEvHgSM0j?=
 =?iso-8859-1?Q?C4Xgi3pBag1qMtW3SlFsYP8X1KKVMdn60y2buZr6Fg/RCqj6OhzeTl30ah?=
 =?iso-8859-1?Q?z6pD50UVvoWcYX2LrxSTXFyug0k+Gb/pYxKNYCLFpAibiuI1o1byMo2VgJ?=
 =?iso-8859-1?Q?23/0bpo2dS4lPeaTRR839crZG8kbj2zQ+klCtsIl9jDpzAgpp8hxbGvsJP?=
 =?iso-8859-1?Q?/sO5/NJc8WmQmZn3V3cqHKugFETLuuElAtPgkp/3SxOVKBQQSIMGHz3hEY?=
 =?iso-8859-1?Q?jyBc6BsudDomQ6k2QB1Imjo7pX8+zMxF73P0euXNtg0uaJrvxStF/4Cn+e?=
 =?iso-8859-1?Q?baQqzAzmi7Ham17TnFpk4o2t2Z9ChK5yCifwBskHD/zBsQqyoVHvoKUPus?=
 =?iso-8859-1?Q?8GiV/9sLsv1Q0OneKi7MyGSeAHWzc79lz1TsJxUOEz9vTRHVskkkTMVLYd?=
 =?iso-8859-1?Q?XelSlOU4z8aSNY3+rc7s8HensB25O+XHuD8cHodEw4VWA8S4ZFyBhztw0L?=
 =?iso-8859-1?Q?8RmYsSFPGg6J+oekSCtTJohD/zv+gwLZempRdDm9Djc1URdFEmzvx/M15Q?=
 =?iso-8859-1?Q?UsuRgt52aengXHBECmvLu6Fc8KuvvZshvVQWFFItux9kttSvQbprnTN9sP?=
 =?iso-8859-1?Q?C9IhJ0o6ztYDt/aMev3+IW5d4r7fqRhn01dpaW3a3CPKEoSOrJlc5pRDcl?=
 =?iso-8859-1?Q?MNk5ef4sa0vkLBsXBLnJ+LMmN0OSK6/NWlDJoZDG6YmuLVVhQFV971p19+?=
 =?iso-8859-1?Q?HVO32K6zw0FgEKawOGOgB/V6m+Ivr/aQquHQTBqRfnMetkDI4FG/ufWXFW?=
 =?iso-8859-1?Q?bkLVRsFEutButxPmNrTPiRsP8lSxeHa4mkf8YPx15tSbfA+Nvtj5PC5fgd?=
 =?iso-8859-1?Q?Jbs+gcAL18JmojFUQ1SeNSVHrqnqNO+4ddH2mQEHlW/U7Sz+MVk7FLnQda?=
 =?iso-8859-1?Q?b6SmZIosbttqlevkaHZsopYSqJ7C8IQUJ3GcMXYYb6YMqg6gie0lL/z80T?=
 =?iso-8859-1?Q?TBDeRORY+ahlNF5CBUEY4Eyr9wZpqxr2O2uxXN8fQMmr82pSS+Ahdsf40s?=
 =?iso-8859-1?Q?ZM8HFC3AADv1in2r6aItnc7mGtR6HIQ1wrS6zjcFms6r7wK+SG2N2gTnH0?=
 =?iso-8859-1?Q?fwG6e0k4b5XkJHuRv/qgnyD2bvUXfV0G/I3WDH/vkyLrFI4Q2OK5yMbgZZ?=
 =?iso-8859-1?Q?yYqf775168RHLzLWaxaPhV10pUlbzS4b9vVsP6NQA3++qXpZlBR45OmIB4?=
 =?iso-8859-1?Q?ongsUCK+nMj+ImNnxVABwryE+Wyo4u2yZwjgfjr9ZrYBn5bENdlDdKjoXq?=
 =?iso-8859-1?Q?HFbQoPda1JK9H4QQvLd7Lt6t1Bw152Af/m0D4yAdFmj6K5MpKctQ+8zgjn?=
 =?iso-8859-1?Q?GFA/e2VKh1K37nVsJnm6JrW5kckJqtcXHUYbIXK+y/3ZRlrKAcnve+1gEu?=
 =?iso-8859-1?Q?vTVNAnz7tLgJZluZo9TZolEMJfWODjVmzL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d79ad6-a9b7-4746-2096-08dc1640a010
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 03:09:59.8568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPmaDbZ8gLFB/D3fi0VFxrTKxrneAUAP8RnYOiNPgc+GHsmV2gjIc7h7TGi/W1o9WgHBWFFDqSIXiuLHbHJxxnrQK67g/fRh1ftxllog2iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7153
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> > +  pwms:=0A=
> > +    description:=0A=
> > +      PWM provider.=0A=
> > +    maxItems: 1=0A=
> > +=0A=
> > +  "#cooling-cells":=0A=
> > +    const: 2=0A=
> > +=0A=
> > +  cooling-levels:=0A=
> > +    description:=0A=
> > +      The control value which correspond to thermal cooling states.=0A=
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array=0A=
> > +=0A=
> > +  tach-ch:=0A=
> > +    description:=0A=
> > +      The tach channel used for the fan.=0A=
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array=0A=
=0A=
> What is the tach-channel and why is it different from pwm specifier?=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Using the Aspeed SoC as an example, our SoC features 16 PWMs and 16 tachome=
ter channels that can be employed to control and monitor fans.=0A=
The "tach-ch" parameter is utilized to specify which tachometer channel is =
being used to monitor a specific fan.=0A=
The "pwms" parameter is utilized to specify which pwm channel is being used=
 to control a specific fan.=0A=
=0A=
Thanks=0A=
Best regards,=0A=
Billy Tsai=0A=
