Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA35FC6D4
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Oct 2022 15:55:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnZ0T4Yq9z3bjj
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Oct 2022 00:55:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UozGTu6Y;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=warthog618@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UozGTu6Y;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnZ0K1SZDz2xJ8;
	Thu, 13 Oct 2022 00:54:55 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id d7-20020a17090a2a4700b0020d268b1f02so2059616pjg.1;
        Wed, 12 Oct 2022 06:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
        b=UozGTu6YyIYkQQoEJ9mpP/ZP9EXBHkczxk9/ST0nwoYD5CXIifS1ksxnJ1z/XlD8Iv
         DnXdQDc3QD5BBRt/elc/g3MpiMLgBMvz47ICmyWRQUwskodG72pwSD0FvOfnFwxR4gNT
         0Nv0c1ZEd9a//beEgotrvzkxpjlIn11dOn3z2tb/KyektIxRp3AMw9k8NLnKlAlJMfAZ
         ZW00APC6mm2Rgc0I9F6MtW+FIkz4pX/PUfBY7jV2tV/BJmcb7sxvPImZbSg5MEvkpS1A
         VQqSmx00wjuq8wBY7o0koQO6OL1C+JRHOCj4nWqmVRt4CML82YQgP9dT0rzT4hrO952e
         5MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
        b=wAEyZjvCSNTPerFWnvKH1bDbyq5VjkLAnZwSRhbQqSHvlP7RrSGodiT2xNB9eg92DC
         7wvNPmg/gL7ZB+kDxEpt8D95o1D51TOYeLCp6PBDXUG9K0mX7zhF5aN2Ak/6M/oblPYL
         ZkWoOSUa7u85AdxMmM/jQjYUiWgdwLnRlIcx2WaZbv2dzSavyuVsWdOfBA4H6GCTKLR1
         E+E27G4uWtMPlNS6geiMOBDXEwSP8li5T7yftjaTmObici5zLoimSyGutJmSNpu2LwRd
         U8pkh5pKbrdiEnofHfigZhUn4ntbeRcJjHkEgzCwUjtTGWpQVhTGVm1zCXZ4dxkAijjh
         T1nQ==
X-Gm-Message-State: ACrzQf2IL7fcjOaZozqIeXAmXCLs3+5Z3xBrh2AYyl+x3bkotzUIEEPe
	ImfuL94jGAcsYJfsK3YOhek=
X-Google-Smtp-Source: AMsMyM4GsOvqLbKi8bnipwZei9bul2eCxZ/xzZEAA7xagdE0qfFC/6Wvyu2i9hoIPRYsb/0vz6gCvA==
X-Received: by 2002:a17:90a:f2c3:b0:20b:b75f:2f9e with SMTP id gt3-20020a17090af2c300b0020bb75f2f9emr5408380pjb.43.1665582890145;
        Wed, 12 Oct 2022 06:54:50 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id s20-20020aa78bd4000000b00562f6df42f1sm8959924pfd.152.2022.10.12.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 06:54:49 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:54:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0bHH06cbngWk4mH@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
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
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Geert Uytterhoeven <geert+renesas@glider.be>, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 04:30:05PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > -#include <linux/gpio.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio.h>
> 
> > But moving the gpio subsystem header after the gpio/driver is not
> > alphabetical ('.' precedes '/') and it read better and made more sense
> > to me the way it was.
> 
> Okay, I will move it back.
> 
> ...
> 
> > > +#include <linux/seq_file.h>
> > 
> > I wasn't aware that we use anything from seq_file.
> > What am I missing?
> 
> 
> Eventually I can answer to your question: the commit 0ae3109a8391
> ("gpiolib: cdev: add fdinfo output for line request file descriptors")
> is what you are missing.
> 
> That said, we need this patch.
> 

Ah, yes - totally forgot that one is in flight.
That makes sense then.

With the gpio headers retaining their original order:

Rewiewed-by: Kent Gibson <warthog618@gmail.com>

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
