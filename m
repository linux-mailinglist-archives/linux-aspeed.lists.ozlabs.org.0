Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD13FAC53
	for <lists+linux-aspeed@lfdr.de>; Sun, 29 Aug 2021 16:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyGbR3kL8z2yJQ
	for <lists+linux-aspeed@lfdr.de>; Mon, 30 Aug 2021 00:50:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyGbK5M3wz2xr2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Aug 2021 00:50:37 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC7BA60F38;
 Sun, 29 Aug 2021 14:50:29 +0000 (UTC)
Date: Sun, 29 Aug 2021 15:53:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v4 01/15] dt-bindings: iio: adc: Add ast2600-adc bindings
Message-ID: <20210829155344.370348d1@jic23-huawei>
In-Reply-To: <DEB9D606-6489-4993-A5E7-6E4F3226EE5A@aspeedtech.com>
References: <20210823070240.12600-1-billy_tsai@aspeedtech.com>
 <20210823070240.12600-2-billy_tsai@aspeedtech.com>
 <YSTiUPQa+HYSA63t@robh.at.kernel.org>
 <DEB9D606-6489-4993-A5E7-6E4F3226EE5A@aspeedtech.com>
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
Cc: Rob Herring <robh@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 25 Aug 2021 00:06:47 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Hi Rob,
> 
> On 2021/8/24, 8:13 PM, "Rob Herring" <robh@kernel.org> wrote:
> 
>     On Mon, Aug 23, 2021 at 03:02:26PM +0800, Billy Tsai wrote:
>     >   > +properties:
>     >   > +  compatible:
>     >   > +    enum:
>     >   > +      - aspeed,ast2600-adc0
>     >   > +      - aspeed,ast2600-adc1  
> 
>     > What's the difference between 0 and 1?  
> 
> Their trimming data, which is used to calibrate internal reference volage,
> locates in different address of OTP.

At very least document that with a description: here to avoid anyone looking
at this later asking the same question! 

Jonathan

> 
> Best Regards,
> Billy Tsai
> 
>  
> 

