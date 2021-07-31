Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5733DC730
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Jul 2021 19:24:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcWNX4zrpz308Z
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Aug 2021 03:24:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcWNV12djz303D
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 Aug 2021 03:24:42 +1000 (AEST)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E763D61042;
 Sat, 31 Jul 2021 17:24:34 +0000 (UTC)
Date: Sat, 31 Jul 2021 18:27:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [v2 1/8] dt-bindings: iio: adc: rename the aspeed adc yaml
Message-ID: <20210731182714.7197bdcc@jic23-huawei>
In-Reply-To: <YQMQJ15KpM0eeLIb@robh.at.kernel.org>
References: <20210723081621.29477-1-billy_tsai@aspeedtech.com>
 <20210723081621.29477-2-billy_tsai@aspeedtech.com>
 <20210723154456.00006744@Huawei.com>
 <E650AFD8-FFD1-4D87-87B0-42D20D9C3BB4@aspeedtech.com>
 <YQMQJ15KpM0eeLIb@robh.at.kernel.org>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jul 2021 14:31:35 -0600
Rob Herring <robh@kernel.org> wrote:

> On Mon, Jul 26, 2021 at 06:53:07AM +0000, Billy Tsai wrote:
> > Hi Jonathan,
> > 
> > On 2021/7/23, 10:45 PM, "Jonathan Cameron" <Jonathan.Cameron@Huawei.com> wrote:
> > 
> >     On Fri, 23 Jul 2021 16:16:14 +0800
> >     Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> >   
> >     >   > The aspeed,ast2400-adc.yaml not only descriptor the bindings of ast2400.
> >     >   > Rename it to aspeed,adc.yaml for all of the aspeed adc bindings.
> >     >   > 
> >     >   > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>  
> >   
> >     >   We try to avoid 'wild' card type namings most of the time and instead
> >     >   name after a particular part number.  I say try because clearly
> >     >   we let a few in over the years :(  
> >   
> >     >   It is very hard to know if this binding will apply to 'all' future
> >     >   aspeed ADCs.  
> >   
> >     >   As such I'm not sure this particular rename makes sense.  
> > 
> > If I want to extend the yaml file to compatible more versions of the aspeed adc.
> > Would you suggest to add new files call aspeed,ast2600-adc.yaml or just append it
> > to the aspeed,ast2400-adc.yaml?  
> 
> If 2600 is not backwards compatible with 2400, then probably a new 
> schema file. Given you are adding new properties (which only apply to 
> 2600?), then most likely a new schema file. Depends at which point there 
> are too many conditional (if/then/else) schemas.

Agreed.  It's a judgement call you need to make on when it is worth the new file.
Note that doesn't have anything to do with splitting the driver.  We have mulitple
binding files for single drivers and for that matter multiple drivers for single binding
files.

If it is 'compatible' enough to not make the file to complex, then add to the existing
ast2400 file without renaming.

Jonathan

> 
> Rob

