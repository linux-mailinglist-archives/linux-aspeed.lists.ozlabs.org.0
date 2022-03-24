Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9644E5F5F
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 08:27:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPGyx5DBFz3085
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 18:27:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=cRFHHJ1q;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70d;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=cRFHHJ1q; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPGyl5KLCz2yNv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Mar 2022 18:27:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFRYXbMki+KG5XvCJwkhzS37kAn+1a5d+0rs+H1En+5wVdUCtGLw1DAFZfR5fUOstFRvbpuBGPrJ5HSzwFn+A9J05mfLknM06XThDHoSJ+NH/5texs1kXkkq+KPZHbxYkoNdW9KLKHs7z+oaBjdi+l2Knf8LFX5OUj0b8idfzB0O0RUDtJimRAvxHKDfr+Ztxt7oH/Ioj5dz4hh0LG6qMwpq/Jj8Fcg7hxJh8GKB1WZs8cWkUpkIRtkCJ43NrDXmUAx0wWLqW5G3c5sqlxgp8oEpXIUikP7t77lM6Gy9x25VVaSnU2c6Ti2HbApmpQ8TlOIB61mTdbclmKXvOVHmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn5zS0m3wcD+Xu4iO/bemuvTNy7QBksoirk9A/gDGCQ=;
 b=by2fW1nfODvEaSKrVZHu8FfmjMm6irWWXcqcw0Dgx7l4tSo5ZehdBM4DePVr8nL7YEzZuOGdHeiHlh9XQhSn3T31TKRo5y11MaHUrrGa9179T4SaGVT7q4eV+1kpqOkVqkue/z/vIr8ixAAqNkeA0w30RKfV9MfyOgZgmz6egMxla0KXlmHyE4psi1YRS4KFTToRPd9Hqtm1gSFzW3wwMzgvnvYVVkdErrair9tpzM/JlD7hgd3yq8/Z9WM/j3LKVKH1jPTbRHfc/9Rup6q9lXQcBm4pJJVTInAwGdPPPX/1gA/F17oq3bfRgs6c2M+2XEFC2IMl69VeASr/FPIpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn5zS0m3wcD+Xu4iO/bemuvTNy7QBksoirk9A/gDGCQ=;
 b=cRFHHJ1qUUwUZJss9qUUGo/g721II29YeKSIVwlMMq6seTvAJWkRel+FiYMhCZgLAkMuUc6FRmce34HVBG7bbuwUShfTVSqh4wQ0IOWzHWLXtc9yNu3RdkiV/KavZeSswtfgtyHMpa3Qml40O5i6V4m40VHvW9y23I3ruazm9tu+KAYLLX8MrFPt28MrS9Dn5XV/lhfuDlhVEQOPFqPlXbHNmuqR1Nzs1FyLdMPZqzWgy8K9yCcK7QDXFHgIu9+S/5/cw114HpzrGGRdZfgH+cFxbDSNJFN4feWGzoreKHc6Iki3gczJx90jJpP0ZD6Ux8ZYf577tEoT9VYOU5bIMw==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 TY2PR06MB3598.apcprd06.prod.outlook.com (2603:1096:404:fa::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Thu, 24 Mar 2022 07:27:17 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::ac36:fcaf:45dc:f830%6]) with mapi id 15.20.5081.019; Thu, 24 Mar 2022
 07:27:17 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "andrew@aj.id.au" <andrew@aj.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] ARM: dts: aspeed: Add video engine
Thread-Topic: [PATCH v1 1/3] ARM: dts: aspeed: Add video engine
Thread-Index: Adg/TfQWHt5K4ym8R6WUVGqohW/koQ==
Date: Thu, 24 Mar 2022 07:27:17 +0000
Message-ID: <SG2PR06MB2315C9F4348D39DA1A448852E6199@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efc10c7e-d60a-4cc6-1c39-08da0d67b9cd
x-ms-traffictypediagnostic: TY2PR06MB3598:EE_
x-microsoft-antispam-prvs: <TY2PR06MB35986498EA251F15034590BBE6199@TY2PR06MB3598.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OtOq/kuWQNwrTXVfAJiEm2tKbmkWs4uUE4MSaH2j6ZoWMJEJzTqCXL6s9CDwGwfVazZSzQKC5UfhB/ZkwQfA757k0sIvDV87Cl693b4hvX7fRyfv8jzRpHgpjCGtEr6ZF9EDLaUk25dCtr+vFd18mzm4FzZJXz1dG+r0bkqJoxxHay3y3z6PU+NUj7e1/tZIbS/Wl2M9QtC0ESeR/RCY0PGdz8II5ZqJrng71YYkyIvahpakabUDbtN6amo39MFuXPT9B6Ppg0cqzB+toEDJFJpd7plDPK1BVLASlXYPBiiqKDIGyBDIVczmAOfypCxNG6cSM3CFZAzoEZilXXQ7oAjx7S/8EDHpbhaCMMxqapQmJ7/y40lMzCMxxtL2kd15bZAWXlinYGaILkpFV7u87KgDStXro2xXBU7CK/ze+11KlavKAPeDlpUkzkz+SZduuJJEM/nxlVXomoqJdAe+QcEDObR4XgdoCMvT4szQlq1AH+bWG2BycqxxBrFKnw+W6czm5mYv8qnWbfAotxAyH8d1eRwf/aHDSoiAjCcpT35mTBl5o7ceyc5WVUot/9fGqTsPNIsSou4H8ysJAswA5Ty2wEVvZQB+ISha1tg8GhJ6kSwa5ZGLqNincelOSwqYk7Vipy1v/lFVgEeCjfXeFmHQls3T072bFMB22VXYlMNN83sl5WqgGV1+KhYRDzIZWQINJhzz1/o1FmLEBtXmaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(396003)(376002)(136003)(39840400004)(346002)(110136005)(508600001)(66946007)(4326008)(8676002)(76116006)(52536014)(316002)(2906002)(64756008)(66556008)(66446008)(66476007)(71200400001)(86362001)(38100700002)(5660300002)(38070700005)(8936002)(33656002)(26005)(7696005)(9686003)(4744005)(186003)(6506007)(122000001)(107886003)(83380400001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?y3e8Dv+YyLHRD80pSfPxAYr5B5taNqN8BU4QUUiX7l85lHvhKRyV5E3fX51E?=
 =?us-ascii?Q?3EMyRIQrBop1JKMYt9YwIt7XUGFuABKb07Qilwjiz2AUNURu28l6Apj2HB5L?=
 =?us-ascii?Q?1HuKI+DxY3UHY3DFQ24/9/MbLD1PtxyBsTNy6BjPgKXxoSdaYNT0ulxJN8O+?=
 =?us-ascii?Q?BMUOHI8WM+MN6r4Hhgk5WWcCCCQLDgy9GkijdJxN57b8n5WR0i3wDGel5HoQ?=
 =?us-ascii?Q?2pfqzfL9+vTgTR/PQf9YD06XHPbgTu+dPS3Dqk7jENSrafsVRuxKuTkzQxjC?=
 =?us-ascii?Q?4H9AKaCryR9wmXbvKaqbsr6+tQAtAdPrMxk9uHuIDxfow0xMDNobeDVw7lMc?=
 =?us-ascii?Q?8s9Lo0Jke/x1WJ7RSDgF9/J8n69sepzUEbsd7A+AuNYB6Vhj4RhcmcRsrQzL?=
 =?us-ascii?Q?LZAitYr++AlpSf+67XAMMas3GanLhR9emcb3g8TtqNCZBWantDS5Ydtfrjc4?=
 =?us-ascii?Q?/oJCwswTzkCnMpfU/7yoWTXr9R4OZvuQjtjtbdYxpIF3rh7JKzq+0Onm1fNj?=
 =?us-ascii?Q?9ydHqM3BlG3QAilpgDQhVLAm/J+4UxDo8CN8Co6EuW8UcukxbjpekOydULjl?=
 =?us-ascii?Q?L1ovvEbnCpmO4pRhQRAb+03FC3FUWbUa6/y7RgekxvX4KAL82uHA+pyVQIx+?=
 =?us-ascii?Q?Od2LLyYuiXgTOV0gTSHFHXxSvOOlHj6sfEl7BBv3vxTgMRFRVIzO8inCoor6?=
 =?us-ascii?Q?QWfbBqRCDAvbnAg0RvcT5ciKkOSUgRFzXZQkg8MgJS6kYPYI28b9DS4Fq/VA?=
 =?us-ascii?Q?6cktYK0bp8aiRPs0Mr7+QcYxggtURjA78EJ5eECv+6DJr37TNW5XtHq4wACX?=
 =?us-ascii?Q?wOH7a1mCIM12XkBJpvwGoznjZKQgHcJ8bBeiOrjo9oQNSJ6G8FKuhUVUxdFG?=
 =?us-ascii?Q?nnIuD+7gADxfNlGkgiM/q+rF807aIOAOZjdzL6VW2D5tJBuZGHKJ9I6DQm5y?=
 =?us-ascii?Q?2BA+koVcSETJ/UJnu73wRTY65ReeyPEIqVxzbtv0TwL2BhMki+nMF12Vk62M?=
 =?us-ascii?Q?6KAuop+Tlk4cQtaznASJzIu7vbXCZy+6Yhbu9/nyrc/rkjkSRK2PqbQdoOyy?=
 =?us-ascii?Q?50+DPA+0zlwswLr6jwkW/MM/xcSVFNQD1QP5bOiA2I0cmVuISNsWXdPNA3na?=
 =?us-ascii?Q?c8u2OyoHbvjUgGcAJ+MrT4mK/ILauPN/j5ntWerDc2UxgO/df5YLqSbkdexQ?=
 =?us-ascii?Q?alNwU2nL8FNBbAw2rA2s9+jNh37CcRvrIKqiuy0dLQ1I6S8rsQ184b7Gv8vi?=
 =?us-ascii?Q?KL8HEPYVd5uTQK/h/fpfzR8S6sNdZWbmF+XYV/8rQI/PnPvW1PiXybduP//r?=
 =?us-ascii?Q?PPasHtGWNvrZ8HLwH+T/qz6nBu3YOH/UDh0pRxNx//Vhc9O6Q3XAPCJDONNz?=
 =?us-ascii?Q?JdIx8xTHtcM1EXx5fIRdEuqI/EdvxAmivVKfF4vZKzMlZYYuXTXz5j0AtoV1?=
 =?us-ascii?Q?6JPo8VPXHzSD/9j4uMueiJx3KSD/FbIliJF0A9GulmjHfsKHTVw4Sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc10c7e-d60a-4cc6-1c39-08da0d67b9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 07:27:17.1522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgMmsDAEuxGuBhiARMPZvRYLvzv31iT7io8o9TzW6JGlDF5XpLPl1svKZ83KhjeGDV0v4p+7MQZ2wKU9Y5oJ4pwWLI8p2H4eT22q0TkVcz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3598
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 SoC has an embedded video engine

Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6=
.dtsi
index c32e87fad4dc..41d5087f7d92 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -389,6 +389,17 @@ sbc: secure-boot-controller@1e6f2000 {
 				reg =3D <0x1e6f2000 0x1000>;
 			};
=20
+			video: video@1e700000 {
+				compatible =3D "aspeed,ast2600-video-engine";
+				reg =3D <0x1e700000 0x1000>;
+				clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>,
+					 <&syscon ASPEED_CLK_GATE_ECLK>;
+				clock-names =3D "vclk", "eclk";
+				interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				resets =3D <&syscon ASPEED_RESET_VIDEO>;
+				status =3D "disabled";
+			};
+
 			gpio0: gpio@1e780000 {
 				#gpio-cells =3D <2>;
 				gpio-controller;
--=20
2.25.1

