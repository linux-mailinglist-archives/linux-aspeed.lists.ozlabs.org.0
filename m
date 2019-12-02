Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056210E9C0
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 12:45:30 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RNbC3krWzDqRw
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Dec 2019 22:45:27 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="JLrik/Q5"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RNZm4L5czDqJm
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Dec 2019 22:45:03 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y19so27675662lfl.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Dec 2019 03:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
 b=JLrik/Q57hkA2pLMTsCgFgbbXQCV50ILFodTufcKAu1zVJThyK0XovKHqlm3wjIFXo
 thgwxcec57cupokH5vqIRP6Afm0WjEpc8qBe4nJwWGCNznGEyDTdlFrWzt3OQTWUtu7B
 9ojKBJ/a48Jp/wQ+CQoM8wncSSs9mNnuHZ41QHW7sAbD1bWBUOfgQH8nXdwsrzD82tOh
 +IJzbYXg/z1w5aY7ZGrLvj9474omGAyq7H6tFWkuH4FUM5PHsVMnE5lVUh/cwKaJl5tf
 /hhm7GuvMk6MXuDzwMfDqLgev32ArbhFfgAw6Pg0WZ76yLzTdJvlrpcRC1xyT7XWfzk0
 QIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
 b=Uhk1ZDwtO/jNQ6V23jNtx1FvxRZcfNpv7900MCmTaXi5c5Sx8ew/npnojnnIza8Miq
 E30313p0CymwebqxUOFti5tVIQ8US9RFtMdmqgWkrwQWQuGZdrbLBUpa2psK+QRKgJwT
 db8/EPUD7K00CQMA/T5XimQ/H8+GmnKftGgGKxyf5jvlgV88ne8mZCx+itJ2qm4IpnWG
 GoSRU3xu+5ROpPxSw1/OCNRFtTJe9XXgi0hfucE3F460wzLDeHKQrjlVHAGvHWeVmRC9
 WyxF2qAMkWPaZ78IvnQcN3tgJFqPr4YbSLl+AKSZ7mIxYbo1fLEIZ7R/6d47IVPhv/CC
 xZ8A==
X-Gm-Message-State: APjAAAU54TkMl8z/0/tkGdgVZ/vAIZ9wjGNluFNbbbD/CIIWLevkBco3
 ZeMs4Tk/kaEVFZz7pn9zYyo22JKWiWUldoiGus5Z+g==
X-Google-Smtp-Source: APXvYqyoHJVudY4Th9gkUkwA7ZvcT7SMc/yaucVRZjkFgzCxhl/qzF5ng9XGEy78xknVHWJ5WXqV+foidMFPzNGJqww=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr41600526lfi.93.1575287099487; 
 Mon, 02 Dec 2019 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Dec 2019 12:44:48 +0100
Message-ID: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
To: Marco Felsch <m.felsch@pengutronix.de>
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
 Support Opensource <support.opensource@diasemi.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> this series address all comments made on [1]. Patch "gpio: add support
> to get local gpio number" is splitted into:
>  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
>  - "gpio: make gpiod_to_offset() available for other users"
> Please check the discussion [1] for more information. You need to apply
> [2] to test the new features.

I am very happy with the shape of patches (1) and (2).

I can apply these on an immutable branch and merge into the
GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
to pull in so they can merge the rest of the patch series on
top.

Alternatively I can merge all the patches into the GPIO tree.

I suppose this is not so much of a MFD business at this
point so whatever the regulator maintainer prefers I suppose?

Yours,
Linus Walleij
