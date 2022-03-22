Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E014E3B75
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 10:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN5JR0Cw9z2yjc
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Mar 2022 20:08:55 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN5JK1Ckcz2xVn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Mar 2022 20:08:46 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWaV3-0002h8-Qv; Tue, 22 Mar 2022 10:08:21 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWaUn-002G5K-VH; Tue, 22 Mar 2022 10:08:08 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nWaUq-00015B-0c; Tue, 22 Mar 2022 10:08:08 +0100
Message-ID: <b861bc8259084432dffe3ca6b3a76ee682fd4b64.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties into MDIO
 nodes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dylan Hung <dylan_hung@aspeedtech.com>, Andrew Lunn <andrew@lunn.ch>
Date: Tue, 22 Mar 2022 10:08:07 +0100
In-Reply-To: <HK0PR06MB28348F925FEDA3853DD3489D9C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <20220321095648.4760-1-dylan_hung@aspeedtech.com>
 <20220321095648.4760-4-dylan_hung@aspeedtech.com>
 <eefe6dd8-6542-a5c2-6bdf-2c3ffe06e06b@kernel.org>
 <HK0PR06MB2834CFADF087A439B06F87C29C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
 <Yjk722CyEW3q1ntm@lunn.ch>
 <HK0PR06MB28348F925FEDA3853DD3489D9C179@HK0PR06MB2834.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-aspeed@lists.ozlabs.org
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Di, 2022-03-22 at 03:22 +0000, Dylan Hung wrote:
> > -----Original Message-----
> > From: Andrew Lunn [mailto:andrew@lunn.ch]
> > Sent: 2022=E5=B9=B43=E6=9C=8822=E6=97=A5 11:01 AM
> > To: Dylan Hung <dylan_hung@aspeedtech.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>; robh+dt@kernel.org;
> > joel@jms.id.au; andrew@aj.id.au; hkallweit1@gmail.com;
> > linux@armlinux.org.uk; davem@davemloft.net; kuba@kernel.org;
> > pabeni@redhat.com; p.zabel@pengutronix.de;=20
> > devicetree@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org;
> > linux-kernel@vger.kernel.org; netdev@vger.kernel.org; BMC-SW
> > <BMC-SW@aspeedtech.com>; stable@vger.kernel.org
> > Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset properties
> > into MDIO
> > nodes
> >=20
> > On Tue, Mar 22, 2022 at 02:32:13AM +0000, Dylan Hung wrote:
> > > > -----Original Message-----
> > > > From: Krzysztof Kozlowski [mailto:krzk@kernel.org]
> > > > Sent: 2022=E5=B9=B43=E6=9C=8821=E6=97=A5 11:53 PM
> > > > To: Dylan Hung <dylan_hung@aspeedtech.com>; robh+dt@kernel.org;
> > > > joel@jms.id.au; andrew@aj.id.au; andrew@lunn.ch;
> > > > hkallweit1@gmail.com; linux@armlinux.org.uk;=20
> > > > davem@davemloft.net;
> > > > kuba@kernel.org; pabeni@redhat.com; p.zabel@pengutronix.de;
> > > > devicetree@vger.kernel.org;=20
> > > > linux-arm-kernel@lists.infradead.org;
> > > > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> > > > netdev@vger.kernel.org
> > > > Cc: BMC-SW <BMC-SW@aspeedtech.com>; stable@vger.kernel.org
> > > > Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: add reset
> > > > properties
> > > > into MDIO nodes
> > > >=20
> > > > On 21/03/2022 10:56, Dylan Hung wrote:
> > > > > Add reset control properties into MDIO nodes.=C2=A0 The 4 MDIO
> > > > > controllers in
> > > > > AST2600 SOC share one reset control bit SCU50[3].
> > > > >=20
> > > > > Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> > > > > Cc: stable@vger.kernel.org
> > > >=20
> > > > Please describe the bug being fixed. See stable-kernel-rules.
> > >=20
> > > Thank you for your comment.
> > > The reset deassertion of the MDIO device was usually done by the
> > bootloader (u-boot).
> > > However, one of our clients uses proprietary bootloader and
> > > doesn't
> > > deassert the MDIO reset so failed to access the HW in kernel
> > > driver.
> >=20
> > So are you saying mainline u-boot releases the reset?
> >=20
> Yes, if the mdio devices are used in u-boot.
>=20
> > > The reset deassertion is missing in the kernel driver since it
> > > was
> > > created, should I add a BugFix for the first commit of this
> > > driver?
> >=20
> > Yes, that is normal. Ideally the kernel should not depend on u-
> > boot, because
> > often people want to use other bootloaders, e.g. barebox. You
> > should also
> > consider kexec, where one kernel hands over to another kernel,
> > without the
> > bootloader being involved. In such a situation, you ideally want to
> > assert and
> > deassert the reset just to clean away any state the old kernel left
> > around.
> >=20
> > But please do note, that the reset is optional, since you need to
> > be able to
> > work with old DT blobs which don't have the reset property in them.
> >=20
>=20
> Thank you. I will let the reset property be optional and modify the
> error-checking in the driver accordingly in V3.

No need to change the error checking, just use=20
devm_reset_control_get_optional_shared().


regards
Philipp
