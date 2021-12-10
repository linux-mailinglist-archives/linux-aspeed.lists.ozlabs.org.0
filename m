Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6447039E
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 16:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9ZHQ20SQz3c73
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Dec 2021 02:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GI2pyajy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GI2pyajy; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ZHK5xfZz2yMs
 for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Dec 2021 02:16:12 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id x10so13638868edd.5
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 07:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5OH9qBbqvt4WBvP8D0eDsTshfx6d4drjBogVvdSBDcE=;
 b=GI2pyajyICRQT9VHZY7NCbccijp4sX7SAS0Z5qayxR4B2b/jcMeYn0PHhTO8a/UaZL
 xObP2o0SBGpkNCQXMBGyYZpHpyhlAliFuwtcWXISq81fih2mqy86vEtqlP13DfWzDNNt
 fhfbchHZHFKtc8iWSw/F6TfL6eXiC/1CkDyk69VaSkD6NKyMv1B9FjyOvUyucLxh0H/o
 1X+85NSUs/zt19eXsGdTzZoGm6Au3DM+FvDqGBpeUa3TLyz3fUEP6syAp3YMXp7nDVzK
 QWbNGPtwXTymSkxRQUIPLHL0Cq41CDTc34ztYY5aOF5yvlQ446PG95+5O0JXRNHbsC7Q
 VgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OH9qBbqvt4WBvP8D0eDsTshfx6d4drjBogVvdSBDcE=;
 b=upZ5cRKa89Vw4CSjjQSwDLtLjPTEjBxmjQLNASyqQk4o0EwKmGvytcg4eBPqhgRHZZ
 DVVVQsJIuHVdcMsDLxgfkmZacPLdkswpRXUwOCAyyfla6uhTN7QLV5toTnVptJrtDB9j
 209oUxtv4ZGXWkegx4NLdUV1o2IAj/2f/b3Nz7vNH3uFQVghMjWiTZcCFQwthlqeU//L
 Fhzp4X5MWd4VsuzjOVdhw/8JFbFw9GjoOHFhXDTJ8T3yUXDxMJ8Dq380frAavS3s4WMk
 GIzYCnmSCC5369CuuhxJ0964tpTEDtxao0cePilrI+IiFotzuIcFxSzl0W+Ugp6O+7i1
 kuuw==
X-Gm-Message-State: AOAM533phZwZRDFwlgV6sFM2IsF5qc7I2aP4+83ZUda1U+vxQ9mUlIBW
 lMDz6XZlOKTDlsoAXTFifeD1gBMlu5txr3yqmP7pRQ==
X-Google-Smtp-Source: ABdhPJwaKMUGD0FGA66KUbxvK8xcaa++SfvuFpQu6VS59cWGuJmpxlG88gtXPqegmq1EHGV5YbZVuCHkJ8+BSvnRHJ4=
X-Received: by 2002:a50:cdd9:: with SMTP id h25mr38332780edj.0.1639149336711; 
 Fri, 10 Dec 2021 07:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20211204171027.451220-1-iwona.winiarska@intel.com>
In-Reply-To: <20211204171027.451220-1-iwona.winiarska@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Dec 2021 16:15:26 +0100
Message-ID: <CAMRc=MdBp6HOKtV2QDrGYrqneXMbJZs6zbXCGnq_B9a4JA2i8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
To: Iwona Winiarska <iwona.winiarska@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Dec 4, 2021 at 6:11 PM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> The gpio-aspeed driver implements an irq_chip which need to be invoked
> from hardirq context. Since spin_lock() can sleep with PREEMPT_RT, it is
> no longer legal to invoke it while interrupts are disabled.
> This also causes lockdep to complain about:
> [    0.649797] [ BUG: Invalid wait context ]
> because aspeed_gpio.lock (spin_lock_t) is taken under irq_desc.lock
> (raw_spinlock_t).
> Let's use of raw_spinlock_t instead of spinlock_t.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---

Applied, thanks!

Bart
