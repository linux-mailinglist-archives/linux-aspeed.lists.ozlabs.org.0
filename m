Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE67B4F30
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Oct 2023 11:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzbXH3zQpz3vft
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Oct 2023 20:39:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzbX80Jqpz3c2Z
	for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Oct 2023 20:39:49 +1100 (AEDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzbVB2Vv3z6K60M;
	Mon,  2 Oct 2023 17:38:10 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 10:39:41 +0100
Date: Mon, 2 Oct 2023 10:39:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1] iio: adc: aspeed: Support deglitch feature.
Message-ID: <20231002103940.00001dbd@Huawei.com>
In-Reply-To: <SG2PR06MB3365E89B1543B770AC2EE7E78BC5A@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230925081845.4147424-1-billy_tsai@aspeedtech.com>
	<20230930174501.039095da@jic23-huawei>
	<SG2PR06MB3365E89B1543B770AC2EE7E78BC5A@SG2PR06MB3365.apcprd06.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "lars@metafoo.de" <lars@metafoo.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "Potin.Lai@quantatw.com" <Potin.Lai@quantatw.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patrickw3@meta.com" <patrickw3@meta.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 2 Oct 2023 02:30:43 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> On Mon, 25 Sep 2023 16:18:45 +0800
> Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
> > > Create event sysfs for applying the deglitch condition. When
> > > in_voltageY_thresh_rising_en/in_voltageY_thresh_falling_en is set to true,
> > > the driver will use the in_voltageY_thresh_rising_value and
> > > in_voltageY_thresh_falling_value as threshold values. If the ADC value
> > > falls outside this threshold, the driver will wait for the ADC sampling
> > > period and perform an additional read once to achieve the deglitching
> > > purpose.
> > >
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>  
> 
> > Hi Billy  
> 
> > This is pushing the meaning of the events interface too far.
> > You can't use it to hide a value you don't like from userspace.  
> 
> > If you can explain what the condition is that you are seeing
> > and what you need to prevent happening if it is seen that would help
> > us figure out if there is another way to do this.  
> 
> > Jonathan  
> 
> Hi Jonathan,
> 
> Currently, we are experiencing some voltage glitches while reading from our
> controller, but we do not wish to report these false alarms to the user space.
> Instead, we want to retry the operation as soon as possible. This is why the
> driver requires this patch to handle retries internally, rather than relying on user
> space which could introduce unpredictable timing for retrying the reading process.
> This software approach aims to minimize the possibility of false alarms as much as possible.
Thanks for the extra detail. Perhaps share more of that in the cover letter for v2.
> 
> If you have any suggestions or recommendations regarding this situation, please feel free to
> share them with me.

Why do you need userspace control for the thresholds?
Perhaps this is something that belongs in DT for a particular board design?

Jonathan
> 
> Thanks 
> 
> > > ---
> > >  drivers/iio/adc/aspeed_adc.c | 193 ++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 189 insertions(+), 4 deletions(-)
> >   

