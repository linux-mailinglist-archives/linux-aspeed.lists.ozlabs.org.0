Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49F83A0F7D
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 11:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0M2h1JT7z3070
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Jun 2021 19:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CKuHDfWB;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CKuHDfWB; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0M2c2MW7z2ysq
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Jun 2021 19:17:41 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id bn21so30774465ljb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Jun 2021 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bEG/w+83YCQdhcjk3hMB/2pU0Hzz9e45pwvsQ652QZ4=;
 b=CKuHDfWBu2cwegozqj52R/g3GZnPS2uOKYtWbcWrnQB6pLHMwhDhTdoZjvpBq//AiL
 MLxZwa2uz9ZntVlOJ7sQsyWFIe1iS5JsYfe6Lp4pDUma8MeZfS8l4UsRweQRithBuXfi
 EBy5eM3VpgWhDTrdpb+aKxy/aKTOrUT+8yOM4aiREY/vEfJ8S79T46wGL2VFWYLNCAdt
 n4Qs2ypust5VOR80/jR1KriOS1AseOLMyQ/MF2eOfQyY6vWIXkSLS1Fh12e3/L4h6yNt
 4bBVNkTdUJT3V1j4OsonlnbJTe2gnRrchrwtR+oaGAsPQGQgUGqFBJ4KoZktllY3pBaF
 9x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bEG/w+83YCQdhcjk3hMB/2pU0Hzz9e45pwvsQ652QZ4=;
 b=W/BhOAQ+LEQuqtFXIuJ/rPlsJAmgSnHWAgXH7dpqRZv9d11SW/6IO6JzhbhF4cuKgb
 uaZSQo3vA5RZdztKjGZOGdQMZVzCb6w5UwCGE1vb4NYDEB3aWg8lCKG6kyXNSGiuSFEu
 Joy/WKlDl40QaLWw6AJb6y/rp+IjN5cffSt4SPpQx72jykfvK9OYMilc+H+jj2Qzhbhl
 jRhmx+joWiZIS5Kn8aePp6Dpr5nKGcREJnBmdUv3s/Lio//fUdOTcvFe0rhTuiTevoP6
 7wJPbk3kTM5Vw9pvxi01k2eVqkqfhAmNT/c8cXlcSdK3tjd0rBKxv8mB8QGCr07BVW9m
 aOUA==
X-Gm-Message-State: AOAM533L0n7kx+y0ebABpTs7DPyR0DHWg+9xI0nZJUVmjLNQpHCR8Nvq
 Fop8lJEpSPnjA/jdThVLKXjp6k4kgDVA93Crd2VpYA==
X-Google-Smtp-Source: ABdhPJwh4YesWYyUgVjZAE6+CeyPfHk/453koIwepndYg3pfX5+tYJ7/ek1lIJ5PGwRvjl003ULe/1DyWqcXDvcPOhc=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr21554697ljt.200.1623230253367; 
 Wed, 09 Jun 2021 02:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-2-steven_lee@aspeedtech.com>
 <516bb11a-b75f-49e1-ba79-e5a4c344a7ab@www.fastmail.com>
 <20210604033039.GC25112@aspeedtech.com>
In-Reply-To: <20210604033039.GC25112@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 11:17:22 +0200
Message-ID: <CACRpkdawakx66Nix41h=FzhL--QEMZCcDX=a_hf_kTq+0DjpAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 4, 2021 at 5:31 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> However, it might affect users who update kernel/driver from the
> old kernel/driver as they may expect the gpio output pin base is start
> from 80(MAX_NR_HW_SGPIO).

Why? What users? In-kernel, out-of-tree-kernel or userspace users?

In-kernel users can be fixed, out-of-tree kernels we don't care about
and userspace should be using the character device.

Just change it.

Yours,
Linus Walleij
