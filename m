Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861040102A
	for <lists+linux-aspeed@lfdr.de>; Sun,  5 Sep 2021 16:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2Ygv0LPFz2yHV
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Sep 2021 00:24:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2Ygr0wYvz2xgJ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  6 Sep 2021 00:24:24 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69C5B60E8B;
 Sun,  5 Sep 2021 14:24:16 +0000 (UTC)
Date: Sun, 5 Sep 2021 15:27:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [v5 02/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Message-ID: <20210905152738.2645b531@jic23-huawei>
In-Reply-To: <YS7ZnG05pZvfA/7m@robh.at.kernel.org>
References: <20210831071458.2334-1-billy_tsai@aspeedtech.com>
 <20210831071458.2334-3-billy_tsai@aspeedtech.com>
 <YS7ZnG05pZvfA/7m@robh.at.kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 linux-iio@vger.kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, pmeerw@pmeerw.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 31 Aug 2021 20:38:36 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, 31 Aug 2021 15:14:45 +0800, Billy Tsai wrote:
> > Add device tree bindings document for the aspeed ast2600 adc device
> > driver.
> > 
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >  .../bindings/iio/adc/aspeed,ast2600-adc.yaml  | 100 ++++++++++++++++++
> >  1 file changed, 100 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> >   
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

I'm going to push on with this series until I hit anything that needs to wait
for the fix to be available.  If that happens I'll have to wait until that's
in Linus' tree before taking the rest.

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to work it's magic.

Thanks,

Jonathan


