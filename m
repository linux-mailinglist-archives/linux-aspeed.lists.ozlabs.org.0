Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02A3D4892
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Jul 2021 18:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXBKf19h4z30FB
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Jul 2021 02:22:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXBKX3CxMz2ym7
 for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Jul 2021 02:22:08 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A00B60E78;
 Sat, 24 Jul 2021 16:22:00 +0000 (UTC)
Date: Sat, 24 Jul 2021 17:24:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v1 0/7] Add support for ast2600 ADC
Message-ID: <20210724172432.50478f0e@jic23-huawei>
In-Reply-To: <20210719080607.28712-1-billy_tsai@aspeedtech.com>
References: <20210719080607.28712-1-billy_tsai@aspeedtech.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, pmeerw@pmeerw.net,
 linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
 linux-iio@vger.kernel.org, robh+dt@kernel.org, p.zabel@pengutronix.de,
 raltherr@google.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 19 Jul 2021 16:06:00 +0800
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> This patch serials make aspeed_adc.c can support ast2600.
> In additional,
> patch #6 is used to improve the adc accurate and 
> patch #7 is used to fix the clock issue in the original code.
> 
> Billy Tsai (7):
>   dt-bindings: iio: adc: rename the aspeed adc yaml
>   dt-bindings: iio: adc: Binding ast2600 adc.
>   iio: adc: aspeed: completes the bitfield declare.
>   iio: adc: aspeed: Allow driver to support ast2600
>   iio: adc: aspeed: Add func to set sampling rate.
>   iio: adc: aspeed: Add compensation phase.
>   iio: adc: aspeed: Fix the calculate error of clock.

Hi Billy,

Small process note.  If you resend for some reason and the original series
has no reply, it is helpful to people if you just send a reply yourself
to say there is a v2. In the past I've occasionally applied wrong versions
when someone does this!

Thanks,

Jonathan

> 
>  ...speed,ast2400-adc.yaml => aspeed,adc.yaml} |  23 +-
>  drivers/iio/adc/aspeed_adc.c                  | 313 ++++++++++++++----
>  2 files changed, 266 insertions(+), 70 deletions(-)
>  rename Documentation/devicetree/bindings/iio/adc/{aspeed,ast2400-adc.yaml => aspeed,adc.yaml} (53%)
> 

