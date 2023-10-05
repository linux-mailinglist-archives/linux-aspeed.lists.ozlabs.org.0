Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2C7BF105
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 04:41:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MzHnEVxx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Kt10GcYz3cPS
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Oct 2023 13:41:45 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MzHnEVxx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1YL26M6wz3vpQ
	for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Oct 2023 01:07:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E3996B824AE;
	Thu,  5 Oct 2023 14:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F8CC433B7;
	Thu,  5 Oct 2023 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696514869;
	bh=2fJZoV1u5RyK5bK3MT3chNjjm8eQ32JHDQecsCKVK20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MzHnEVxxvBa16qdlUbfBdXiBP67kumBvLDCGJtNqPkNqSb2HRHXuBkG+w9o1M0QkV
	 oOr04qcjrR8L2YXtFgdtAcMX/dAMj3cHAPyhV8+igC2XdbOqWjk4MmVD4xxTPaCjew
	 O8TpAu4vf9HoSLAUVNPFZHLcrkPStcfVqp3d/4XLwF+DuTJCm4zY6zxDPAdnybqzB8
	 vaHVUk3RbamOuhoBOmkweyQ6kywQJOfrTLiptlwSfJg0EnGItiNV/f7HOLnjZq5tSd
	 qdzsapPq4cJrsoiLRv91Yux8gBe4seCSTpD4qUn3VR6c6RuWhnX6fFmRFMY92ERzJt
	 raMzryRM52gbA==
Date: Thu, 5 Oct 2023 15:07:53 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1] iio: adc: aspeed: Support deglitch feature.
Message-ID: <20231005150753.38e79c20@jic23-huawei>
In-Reply-To: <SG2PR06MB336557EDAAE2950D192E40838BCBA@SG2PR06MB3365.apcprd06.prod.outlook.com>
References: <20230925081845.4147424-1-billy_tsai@aspeedtech.com>
	<20230930174501.039095da@jic23-huawei>
	<SG2PR06MB3365E89B1543B770AC2EE7E78BC5A@SG2PR06MB3365.apcprd06.prod.outlook.com>
	<20231002103940.00001dbd@Huawei.com>
	<SG2PR06MB336557EDAAE2950D192E40838BCBA@SG2PR06MB3365.apcprd06.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Oct 2023 13:41:16 +1100
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
Cc: "  <Potin.Lai@quantatw.com>, "@lists.ozlabs.org,
	patrickw3@meta.com, "lars@metafoo.de" <lars@metafoo.de>,
	"  <linux-aspeed@lists.ozlabs.org>, "@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org\"          <linux-arm-kernel@lists.infradead.org>, "@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org,
	"  <linux-kernel@vger.kernel.org>, "@lists.ozlabs.org,
	Potin.Lai@quantatw.com,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>, <patrickw3@meta.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 4 Oct 2023 17:38:10 +0000
Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> > > > > Create event sysfs for applying the deglitch condition. When
> > > > > in_voltageY_thresh_rising_en/in_voltageY_thresh_falling_en is set to true,
> > > > > the driver will use the in_voltageY_thresh_rising_value and
> > > > > in_voltageY_thresh_falling_value as threshold values. If the ADC value
> > > > > falls outside this threshold, the driver will wait for the ADC sampling
> > > > > period and perform an additional read once to achieve the deglitching
> > > > > purpose.
> > > > >
> > > > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>  
> > >  
> > > > Hi Billy  
> > >  
> > > > This is pushing the meaning of the events interface too far.
> > > > You can't use it to hide a value you don't like from userspace.  
> > >  
> > > > If you can explain what the condition is that you are seeing
> > > > and what you need to prevent happening if it is seen that would help
> > > > us figure out if there is another way to do this.  
> > >  
> > > > Jonathan  
> > >
> > > Hi Jonathan,
> > >
> > > Currently, we are experiencing some voltage glitches while reading from our
> > > controller, but we do not wish to report these false alarms to the user space.
> > > Instead, we want to retry the operation as soon as possible. This is why the
> > > driver requires this patch to handle retries internally, rather than relying on user
> > > space which could introduce unpredictable timing for retrying the reading process.
> > > This software approach aims to minimize the possibility of false alarms as much as possible.  
> 
> > Thanks for the extra detail. Perhaps share more of that in the cover letter for v2.  
> 
> Okay, I will incorporate more details into my commit message for v2.
> 
> > >
> > > If you have any suggestions or recommendations regarding this situation, please feel free to
> > > share them with me.  
> 
> > Why do you need userspace control for the thresholds?
> > Perhaps this is something that belongs in DT for a particular board design?  
> 
> If the input voltage remains constant, these settings can be incorporated into the DTS properties for configuring the threshold. However, if the input voltage is subject to change, adding user-space control may offer more flexibility.

My concern is that it's an interface userspace probably won't know how to use, or
will misuse given this seems to be papering over bad hardware.

If there is a 'safe' value to put in DT I'd prefer to see that. I guess it might be per
channel thing to adjust for different expected voltage ranges?

Jonathan

> 
> Thanks
