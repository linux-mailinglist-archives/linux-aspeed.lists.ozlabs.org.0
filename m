Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E91B6B1478
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Mar 2023 22:48:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX5Y34btYz3cLF
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Mar 2023 08:48:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xv/o7k0V;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xv/o7k0V;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX5Xy5dCYz3bfk
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Mar 2023 08:48:32 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536c2a1cc07so329698767b3.5
        for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Mar 2023 13:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678312108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Ycd9MmkZ2o31hnxqTTUh8Ie49xD0xPTPsqNUPpbcE=;
        b=Xv/o7k0Va9ra9mE73WP4AO/knHRACFl8S/3UJgsNtwkCJf4p/6EnG7TSDqfWb5S2ET
         QPTgv1Ack5u+Ior3itotdTnvjFht+PrMP/DvL3wcr087JMTqNVE+O9WDOFucCb4XyM7Q
         hptF+lMH7sS86/kenHZFjyYaXBphhsMtH7rrRI6v/F5opojCYr5tDerr+FJtlnZOqXri
         71LOH+W/uXXYopEz3FmDqnk2nZTqWkv79lesqYnr+vK0TNNYawdqW+pT8vp2Gx43Pyfi
         k3ueFZmbEacvw365C7gte1UCMA5m58UdlGLKHJ10PNw7Lg4k6eM21e3WQlSTv3fiSQSc
         e+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1Ycd9MmkZ2o31hnxqTTUh8Ie49xD0xPTPsqNUPpbcE=;
        b=vZzNE80YorxejcntKAp+htoM32EJK4JcPksNMorhiRW4HUUAQQiyyCG3b/87ERTYuu
         HMtqh45vvxK5aadtnCKbjyDvU/mDHq0Qo9cEHdSfo7Y7i2/rrNYeyDxdFfqkybtm4h9a
         dukOrViRfKZRswv3wnsLXPQf2VxWN+DjLae1J9GrZzh7S03OG/Y4zPcU47L1+A5D9FgU
         vrugniy4K+nKyqCZtp2prJoFDm4C4WZsO2vv62XI+wLFzjKtGFRTy/snsKIfYjDTjd/s
         MsYW6LmdSltOVP9o4fcyH1L3fOaG9WfpY+4o/bt5i49aosRa8wCLLVUw92Q93csEiN6m
         cQzQ==
X-Gm-Message-State: AO0yUKWQ1QWs2s+QKcouLzxZsztI0zxeH1rok7rVIA/yDFdSUsOHyPLl
	I/O15bXI9ikFLhDperUmZPRd70qKTXAnxy81Ymnx+Q==
X-Google-Smtp-Source: AK7set/wE7ucXTrmTPRWG6Tw0KsQfg4nawWkRLd5ehVt2euhHktMPD4UxK14To9kK895Sfm4gvFpqlYTabtJ0vdBjOM=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr11945676ywh.9.1678312108521; Wed, 08
 Mar 2023 13:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
 <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org> <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
 <861qlzz89j.wl-maz@kernel.org>
In-Reply-To: <861qlzz89j.wl-maz@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Mar 2023 22:48:16 +0100
Message-ID: <CACRpkdZ_jEd5hZDGaTd+4Ns7o+oMiAh=pED==WemVCnC-csNqg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-omap@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Mun Yew Tham <mun.yew.tham@intel.com>, Kevin Hilman <khilman@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jay Fang <f.fangjian@huawei.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Romain Perier <romain.perier@gmail.com>, William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 8, 2023 at 2:23=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:

> > >                 girq->chip->name =3D dev_name(&pdev->dev);
>
> And this assignment will probably explode if, as expected, 'chip' is
> const and cannot be written to.
>
> I obviously didn't spot this when I first looked at these patches.

Dang, I'll fix, then I will go over the rest of the patches
and make sure I didn't miss any other of these name assignments.

Thanks,
Linus Walleij
