Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170A11D063
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:00:18 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YcRM2PkpzDr4g
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:00:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
X-Greylist: delayed 461 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Dec 2019 01:59:50 AEDT
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YcQt2Nb0zDr3r
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 01:59:49 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
Date: Thu, 12 Dec 2019 09:51:58 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-3-joel@jms.id.au>
 <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Philipp.  Thanks for your time.

> On Dec 2, 2019, at 7:53 AM, Philipp Zabel <p.zabel@pengutronix.de> =
wrote:
>=20
> On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
>> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>=20
>> The AST2600 SoC contains the same LPC register set as the AST2500.
>=20
> If the LPC register set is exactly the same, shouldn't AST2600 reuse =
the
> AST2500 compatible, i.e.:
> 	compatible =3D "aspeed,ast2600-lpc-reset", =
"aspeed,ast2500-lpc-reset";
> ?

I=E2=80=99m not sure.  I let what was already there be my guide - the =
ast2500 LPC registers are the same as the ast2400 as well and those got =
their own compatibles.  Is there a guideline written down somewhere that =
backs your thinking up?

thanks - brad=
