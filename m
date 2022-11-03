Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5B617F96
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 15:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N35m368vZz3cJ2
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Nov 2022 01:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=inEVvhjX;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=inEVvhjX;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N35lw3V6sz2yRV
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Nov 2022 01:31:07 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id n83so2097399oif.11
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Nov 2022 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTr6gc/qL3/cvufhP664wBsVqSVnACz7cyfjWA6pJ/A=;
        b=inEVvhjX66DeMO1AjWgK9izci/93Si0haRH+O02Xndneum6cFm49kmaOrUGUUxKJqO
         lGq+ITuxZHEN8pV5mQBAofz07U0AStDDR0AztGlLRFALigFRhIhtGWKlbjyefVCZpPU0
         MlFVxEnlgqY8A2SoyoGcz1ToGr1SysyXMgHvr7f1quTkQokhds1LRRNaLZh2X3wofiPQ
         HRPDK+iHw8/H/037UV2x+YJ6ijcgTQgrzxA0NHL22dOnnj9MkI3lVOZ/FV3wPX1teER3
         mPtZNuEQzmGuhXoOeXzYARJFxID/jfhanw9oWrzFCJk9AjtxhFoIKisjmGZG7w5cP/mX
         8Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTr6gc/qL3/cvufhP664wBsVqSVnACz7cyfjWA6pJ/A=;
        b=SkvyKw8RPFzKfGEllW9ekQPbvfOPVYcTQ82VDV0Nq76h29LjC/Z0GJfmL4wC1YBJqb
         fodiutqoTyngg9L03ZY9TuyoFohalfJoULdbrQCRaWd8etAN5gA81hpaU/VPC+dQ/pF1
         udVf7CrG16w94e5Glqw8PuuVS3pVn5TP6DlbQuOAeS7GkMzGPbnpSagvmJeGymME54cy
         pDWPeYMJ9QlDN+ugvABC7/KZFrA2uapp9atH0MhGn2XJ/du8SQ8SeNQ6cHcgXIYZsUjI
         Wi8qFH56O93Ya3i0iEMOHGwB6wibrGKR8p8e4LWbQunWnC9RghjiLfyj3PZzxcFP1Yvj
         qzeQ==
X-Gm-Message-State: ACrzQf3QqjhMO0nNgZ1v87QtG7jI4BEFZvmuoH+PcpC1qrSal0qI5JOk
	DbY32F17YQCSEA/LoDUn2GA=
X-Google-Smtp-Source: AMsMyM6kiE1p+72Nbb5v+BVoVNZhakWQwxVmLMnU2jpvd+wAruwzA58msN/e0z+ahu5+6GQaCdfr+A==
X-Received: by 2002:a05:6808:19a6:b0:355:3ac8:8386 with SMTP id bj38-20020a05680819a600b003553ac88386mr23002209oib.229.1667485863264;
        Thu, 03 Nov 2022 07:31:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9-20020a9d6749000000b00660e833baddsm387598otm.29.2022.11.03.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:31:01 -0700 (PDT)
Date: Thu, 3 Nov 2022 07:30:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 3/3] hwmon: Add Aspeed ast2600 TACH support
Message-ID: <20221103143059.GB145042@roeck-us.net>
References: <20221101095156.30591-1-billy_tsai@aspeedtech.com>
 <20221101095156.30591-4-billy_tsai@aspeedtech.com>
 <20221101131456.GA1310110@roeck-us.net>
 <271C521D-8F20-4C86-B3DA-9C0AD74242D4@aspeedtech.com>
 <20221102170138.GA2913353@roeck-us.net>
 <F1166366-99CC-4A36-A0A2-4965C787E60B@aspeedtech.com>
 <20221103043034.GA2113834@roeck-us.net>
 <E9E92BC7-CB1A-487F-9E5D-2A403A01CB17@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E9E92BC7-CB1A-487F-9E5D-2A403A01CB17@aspeedtech.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "garnermic@meta.com" <garnermic@meta.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 05:40:44AM +0000, Billy Tsai wrote:
> On 2022/11/3, 12:30 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>     On Thu, Nov 03, 2022 at 03:52:59AM +0000, Billy Tsai wrote:
>     > > 
>     > > Can't I use a min/max RPM to let the driver know a reasonable timeout/polling period when
>     > > the driver is trying to get RPM?
>     > > Beacause that our tach controller have the falg to indicates the hardware detected the change
>     > > in the input signal. I need the proper timout to rule out slow RPMs.
> 
>     > If the chip measures the fan speed continuously, why would that ever be a
>     > problem, and why wait in the first place instead of just taking the most
>     > recent result ?
> 
>     > Pretty much every other driver is doing that, so I really don't understand
>     > why that would not work here.
> 
> When the fan speed drop from a very fast RPM to a very slow RPM. Especially when it is close to stopping.
> The most recent result will be no meaningful value. The slower RPM needs more time to sample it. E.g., If
> we want to measure the fan with 600 RPM, the controller needs at least 100ms. During this time period, we
> will always get the wrong value. So, our tach controller have the flag to avoid this problem:
> TACH_ASPEED_VALUE_UPDATE: tach value updated since last read
> This flag will be set when the controller detected the change of the signal and clear by read it.
> In order to use this flag, the controller needs the proper timeout based on minimum RPM to avoid waiting forever.
> 

I am not going to accept this patch as-is. If userspace wants to have
values accurate down to ms, this kind of approach is just wrong. Users
will have to live with the fact that measurements may be a bit (in the 
< 1 second range) out of date. Many older drivers even implement code
which avoids reading registers again for a second or longer. Older
temperature sensors may take several seconds to provide new readings.
That is not a reason to block userspace until a new value is available.
I do not see that as a problem. In my opinion it is much more of a
problem if the driver returns a completely bad value such as 0 or even
an error code because its software parameters did not match reality and
the driver didn't wait long enough for a new value. That would be _much_
worse than providing a value which is a few 100 ms out of date, and your
code is vulnerable to that problem.

Besides, for a fan to reduce its speed that quickly, it has to be manually
stopped. Normally fans take several seconds to stop if power is taken away
completely. Your code is adding a lot of complexity (and unnecessary
attributes) for no good reason.

Guenter
