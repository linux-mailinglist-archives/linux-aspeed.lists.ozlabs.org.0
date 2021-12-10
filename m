Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB247039F
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 16:16:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9ZHW1HYTz3c7k
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Dec 2021 02:16:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dPm8WeHC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=bgdev.pl
 (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=dPm8WeHC; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ZHR3XBLz2yPs
 for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Dec 2021 02:16:19 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id x15so31740523edv.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rs5bg41j4JzTAJjWn8R9+iNkzzHWufek6oB+vt3n73E=;
 b=dPm8WeHCw+MUZH8j3p8zX5QGv8VAUQJGxCofWbwTkjH0pemujX5s0eU+dMZbjS/A2d
 lCatnOoMLL5GJXn0KNvgpBhTp+du1nSoEP8UeX7lb6bGkTwBWyXTXor5t0zVX78Mdi9Q
 D/Fqh6ybMAp6Dwb+i6ynT+eZMrhd5vgqG3mM4lf3JY4W3NR3al+7BWk4AwaKyMLupAn1
 YFOKwW/9UrmxY+oMB25znRiAD14ioDvlLkp6ohexZAcMlaWquwq3xZFLd4OJkka/Ix5N
 fc3mZ+LLiyaHm6i1Vw0iAIAbntOm/XLf/+hNvKkSw6EdcDlVUgeeZDM782jscZRU5Z/+
 Eqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rs5bg41j4JzTAJjWn8R9+iNkzzHWufek6oB+vt3n73E=;
 b=Ur+4aFWC051tc/a7mEyxyE9sDPhdGAsWgPVwB+fGjtN/miN9mK764Nw68aD9pfOFZP
 oKhNOw5NP/wttGGGJeFFTjYdTwD9BX5kfMWDKE7sRiH9IW4b/KUWM4JsuUcEkLX8zpPK
 eZ62VpEIWEM5CRgYClTXbB7zSFy1BAGpADB9lLOLH95KERE3hkbKEDX1oWXEKKHi9lH5
 0tl5LSy8XFscasv3IK5FI3quxEgXqlop1LeRROJsP4zGZ3g4tYqAD7Y7PlSGjNx0OsfM
 t49RQxPcNaQkzw5NYiz4hBg4tcTAS/bheWJgDv5SkRbNm6+R8CHY3kqCOvNBJ1BsSQ0P
 KT1Q==
X-Gm-Message-State: AOAM531Nv6TBO2vKY7dUZqMmFygFVwaj8VkRAk00dVu6ncrnz2n1cBUD
 Wk5GLO+UuhW9pS/8HAJ0Jcv7BqXug+pfV1cxUnOokg==
X-Google-Smtp-Source: ABdhPJz+NLsw0jfL4s/uR9uk+RJoMWfU9WpuXLY75ywELLHLGa9fOaOuORlAuqCnnbpVDNtsHgx5BDcokpq98Uzh2nA=
X-Received: by 2002:a17:907:75f0:: with SMTP id
 jz16mr25332620ejc.77.1639149352759; 
 Fri, 10 Dec 2021 07:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20211204171027.451220-1-iwona.winiarska@intel.com>
 <20211204171027.451220-2-iwona.winiarska@intel.com>
In-Reply-To: <20211204171027.451220-2-iwona.winiarska@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Dec 2021 16:15:42 +0100
Message-ID: <CAMRc=MfZvtwRrY_qhO7vRwwR5=prqkORtfo8FW6YjkhB8jyxBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: aspeed-sgpio: Convert aspeed_sgpio.lock to
 raw_spinlock
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
> The gpio-aspeed-sgpio driver implements an irq_chip which need to be
> invoked from hardirq context. Since spin_lock() can sleep with
> PREEMPT_RT, it is no longer legal to invoke it while interrupts are
> disabled.
> This also causes lockdep to complain about:
> [   25.919465] [ BUG: Invalid wait context ]
> because aspeed_sgpio.lock (spin_lock_t) is taken under irq_desc.lock
> (raw_spinlock_t).
> Let's use of raw_spinlock_t instead of spinlock_t.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---

Applied, thanks!

Bart
