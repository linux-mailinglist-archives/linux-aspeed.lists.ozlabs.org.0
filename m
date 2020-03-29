Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6269219B800
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Apr 2020 23:58:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0SQ1yKtzDrDJ
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Apr 2020 08:58:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=northeastern.edu (client-ip=40.107.69.96;
 helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=liu.changm@northeastern.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=northeastern.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=northeastern.edu header.i=@northeastern.edu
 header.a=rsa-sha256 header.s=selector2 header.b=qNfXtdhV; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690096.outbound.protection.outlook.com [40.107.69.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48r5Tn56YqzDqZ3
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Mar 2020 06:37:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaZGfuEEbzdEAx20FtiH/xOM7nBGAkbam6uytCyf6o7Um9O+xfq+Fr0ArijekyEDLNI7RXXdnU8tng2AMPPAduqAJ1PteeA0Mz0ftqxXONHDjaIi20YKqtuskDUm+IwYfm5d6yEXq8x7onb/P0U7nbAnRkfVJnMaumPO0UcPDRA6XVItNeN4Uf5g06Eyh4yRC6H+aLsXE8I6dj6M5f9muGWk+t4ghKyydJhqjyP1q/fOtBU18hKCVaESVSh9DBiN3qjdfs0TWCwtVLOPxiHhtABvcgfAZuP85jsphQ1MIGTs5f9G5bxFQGs3jgtDQ53a7xeQOSLYKoLPic0AFiOc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjG+Rx7VZ8SE7XN0QGt7/TuazdFi5yMjdC+M/hhLtxI=;
 b=kPtKTZNW8w01tpT+RA1xCuQOuwhUTZEPkrm1zbFQZct1Kw3jZEqTs2+wripm0Tj9Kff7cdsflIoalJXvh3+/KVngH82FJUH7cFHu76Os/u4tcoYPtoBUF4f8nbL8dvlFlc1ezw1HexII1wjMcMSBjmMWB6Tlk7ZnW7QJyRN7QoFm6umAtrh5pv1MZoXHemjP9AJ8GvjBFkm/xaXNFdcgKWyx02xVcHMFSrNhma27jh7vekMYmBTaoUVccvN6j7ORtZ8KxG4QzBmzHX/KQBIlSGXoqu9bE6hV99r5FPvq74OXogZt9is1UpS+2TuCL2xPbOX5o4i84nZvq+np0ua4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjG+Rx7VZ8SE7XN0QGt7/TuazdFi5yMjdC+M/hhLtxI=;
 b=qNfXtdhVKOqJn0+XDRQD/7Lxp3AJPvcp4+Cfz9+9Kb+pvG4zQCzakwf+l472mIJl+bkATu6OFwlAmB3Rxtnqg5EhaLZeVEBA7g7YggB5kGraDYK3lnUUPBLb1uSSzOIwBfcH1oyOMCHTAfBsr1/yM4q14uaWFLOkusY5zUSxFF4=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4722.namprd06.prod.outlook.com (2603:10b6:208:58::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Sun, 29 Mar
 2020 19:37:37 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2%7]) with mapi id 15.20.2856.019; Sun, 29 Mar 2020
 19:37:37 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>
Subject: [Bug Report] soc/aspeed: integer error in aspeed_p2a_region_acquire
Thread-Topic: [Bug Report] soc/aspeed: integer error in
 aspeed_p2a_region_acquire
Thread-Index: AdYGAIGuDCfrUgheRrujj/e7wCdDjw==
Date: Sun, 29 Mar 2020 19:37:37 +0000
Message-ID: <BL0PR06MB45481A385F546CF5B6855C16E5CA0@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [2601:197:a7f:5cb0:217d:acb0:7278:589d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f00045e6-ec2e-43a5-503e-08d7d418a32a
x-ms-traffictypediagnostic: BL0PR06MB4722:|BL0PR06MB4722:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB47224779080779462552DAB8E5CA0@BL0PR06MB4722.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 035748864E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(478600001)(66476007)(66556008)(76116006)(786003)(66446008)(66946007)(4326008)(64756008)(110136005)(75432002)(52536014)(33656002)(5660300002)(186003)(55016002)(81156014)(2906002)(71200400001)(7696005)(8676002)(54906003)(316002)(86362001)(9686003)(81166006)(8936002)(6506007)(70780200001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NE6r+zt744gZlLHZDr5BdrS2H5BiynTxq67YL4trPHm6BKfvmJGm68juc0kmQui9m/sPHBBsj87PZCGHQyivQI4t2tFRhiTkmpPVHPnY2wFowhKC/URzjuK3q5bTwZaL98ynQFM5QhlR1BD1gKRHhb8w6pi2D5ePMiTt1F2jSDnUD6Lc9xiOBLvTsUP8aK5zRJYGRVAjj2vcdVFhxXAb7G6r7aJ/eVsITERIjg80fFDX7FidkL23m/aXfEnuDaoucFigGhN6ula+OwdvAbHRnmMPoQX7EW9C+gEE1wccucZU4iusBn6BUtbqnAESnfzSKV/a6LZNOI6Hsk4wERgvlS8HkzdUynAqT6Nx+daj1x3KFOZZurOUbW146c4WMUhH1MKzdkKx2WAnOyTSV/yLZIQueYKDld9LR/b9J377lEBfZo01vHTlGFLq3VyBS4N3dz9U2k4bghFnm9PchT1i/r6uKkcElzmmClmWnrZfe4wRMUH3zFdOitk/+XYJ18aC
x-ms-exchange-antispam-messagedata: o5JSW7Lk3hPlFjKPbTODjBC/ZnnB9IT50kBeW1Giq9wcrGlQGNhjh8psRsqSuqEaFXB6L1Pzof/oWot8687kV7PvdZSYOBeLf8MajLOKEWezlt5ASyTtTliHnQbqEjwfPvHNC7QGmbzQbz8lEaAULL5BO4JMPEbRpV2Ayc0vWMIzbYvcqPryJ02kaDmTmzvFK7mcxWgjkE0Ul1xvE3hJwg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f00045e6-ec2e-43a5-503e-08d7d418a32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2020 19:37:37.5898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9PgAFwcdwKzECzR1gNxGa6y2qVD8d8905grhbxPdVSqllTh5B+sO0LZ0lIue9P0qpSYsAt+hYsXfzgUHehXL2oVh0KbNLbIxXQcaDlGQ+yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4722
X-Mailman-Approved-At: Thu, 02 Apr 2020 08:57:26 +1100
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
Cc: "yaohway@gmail.com" <yaohway@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "Lu,
 Long" <l.lu@northeastern.edu>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Joel and Andrew,

Greetings, I'm a first year PhD student who is interested in the usage of U=
BSan in the linux kernel, and with some experiments I found that in=20
drivers/soc/aspeed/aspeed-p2a-ctrl.c function aspeed_p2a_region_acquire, th=
ere is an unsigned integer error which might cause unexpected behavior.

More specifically, the map structure, after the execution of copy_from_user=
 at line 180 in function aspeed_p2a_ioctl, is filled with data from user sp=
ace.  So the code at line 136 that is

end =3D map->addr + (map->length - 1);

the subtraction could underflow when map->length equals zero, also, this su=
m could overflow. As a consequence, the check at line 149 could be bypassed=
 and the following code could be executed.

Although the fact that map->addr is a 64-bit unsigned integer and map->leng=
th is 32-bit makes the overflow less likely to happen, it seems doesn't eli=
minate the possibility entirely. I guess a access_ok could do?

Due to the lack of knowledge of the interaction between this module and the=
 user space, I'm not able to assess if this is security-related problem. I'=
d appreciate it very much to hear your valuable opinion on why this could n=
ot cause any trouble if it's indeed the case, this will help me under linux=
 and UBSAN a lot! and I'm more than happy to provide more information if ne=
eded.

Looking forward to your valued response!

Changming Liu
