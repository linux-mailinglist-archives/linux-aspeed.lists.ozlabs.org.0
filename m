Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7511D0FA
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:27:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yd2d1JnyzDr4h
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:27:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (unknown
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ycr20KL4zDr2c
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 02:18:06 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ifQDn-000761-RH; Thu, 12 Dec 2019 16:17:43 +0100
Message-ID: <ccc48df65e340c52218fd45549c26174a10f410c.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Thu, 12 Dec 2019 16:17:42 +0100
In-Reply-To: <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
References: <20191129000827.650566-1-joel@jms.id.au>
 <20191129000827.650566-3-joel@jms.id.au>
 <2498da189d5e21ae70fb6884df6fc16ecfee2087.camel@pengutronix.de>
 <EFF7E049-08C0-40A0-946A-18822C7AEEE3@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Brad,

On Thu, 2019-12-12 at 09:51 -0500, Brad Bishop wrote:
> Hi Philipp.  Thanks for your time.
> 
> > On Dec 2, 2019, at 7:53 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > On Fri, 2019-11-29 at 10:38 +1030, Joel Stanley wrote:
> > > From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > > 
> > > The AST2600 SoC contains the same LPC register set as the AST2500.
> > 
> > If the LPC register set is exactly the same, shouldn't AST2600 reuse the
> > AST2500 compatible, i.e.:
> > 	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2500-lpc-reset";
> > ?
> 
> I’m not sure.  I let what was already there be my guide - the ast2500
> LPC registers are the same as the ast2400 as well and those got their
> own compatibles.  Is there a guideline written down somewhere that
> backs your thinking up?

I read section 2.3.1 "compatible" of the DeviceTree Specification [1] as
supporting that view. If all three LPC reset controllers are in fact
identical, I would argue that both ast2500 and ast2600 are compatible to
ast2400 and should be specified as:
	compatible = "aspeed,ast2500-lpc-reset", "aspeed,ast2400-lpc-reset";
and:
	compatible = "aspeed,ast2600-lpc-reset", "aspeed,ast2400-lpc-reset";
respectively.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.2/devicetree-specification-v0.2.pdf

regards
Philipp

