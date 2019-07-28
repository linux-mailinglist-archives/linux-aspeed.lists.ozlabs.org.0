Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235A78269
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 01:38:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xfQP4DBqzDqRp
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 09:38:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="XlhkQmH6"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xfQH7371zDqQf
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 09:38:15 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id h28so40694639lfj.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2YoLjOmjoi0MvPq3QD0hmADDj+Ydfv3BHipfJHYsV4=;
 b=XlhkQmH67dhcBDB/Xr7JvFPOG2VU81DTdMdboPT/HeIYWgB9tdya4Qu7sHgU0WMkaM
 vLenZczcXQneLoQwwIMosVAUQ7eROBagrCowwDdHynkzWR6TG6G/348pyMvV2ko15fAX
 J6eOaYIHqHdN2UumITKAxV05/2xTZbsY0nfOHx2zKefVEAWZk/V94esJyXg+dV04m9ZC
 3T6esDVVvsV2RDBV0sLFBEN22b9i5xaNaCrAxueDIdJQotuNWYkqh9CJdvvAgneQ8VYO
 PxSF+7xqWZhasZ+4KJQhOOybJ6f/GiXAs/huwwXy1rfoOxGb0FkKxX89PQJ4JjNcb5+Z
 0kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2YoLjOmjoi0MvPq3QD0hmADDj+Ydfv3BHipfJHYsV4=;
 b=Ou9IccfN4us/WLw/jDS9dpJq3LgL3lJkuhfUpc8Tt4yjrRBWf/h6brNZzbV2UQio9s
 oMtfScHbS2LFTbn4X8L6nochTO1ivqZasFdVSshBc+HrLAxCUdEFiJPWLGgL9N7StcI3
 zf8+KhjHpyfvCgG0m3m7LQKc1zNp6qaI79QbWxlj9jd12i1AuO/QubNEXAgQrGDBg2l2
 8WPfICDxR9giz1MMFRsvd0lRtMdLnWNEUqxFo97qmR/8H3J3dEZKhMYEQChcEpi074LJ
 S4i/GqVa/InswP1fcILDiutUoGvwFTtl5PQwIBr1acgFss2Tw3t7Sgq3DVnrBwOuCBjG
 Y/Cw==
X-Gm-Message-State: APjAAAUb2FVXSlMPeqlh0LNkduM4dXETxdEJUtgjM4q+GX8zUgoia/0Z
 L9JMm34UaLhRvjyJma8ovgBZOyshD+O5wm54g6Ra1RV8
X-Google-Smtp-Source: APXvYqzNLF2GKPsxU0k1Fl9UXDm3yiIIWBYWeFyjCRu2eWqJIj+FDChdYuoS6Cmi6P1mJrVQoHtEsToFX8UBgZc9YJM=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr45895639lfg.152.1564357090803; 
 Sun, 28 Jul 2019 16:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-3-git-send-email-hongweiz@ami.com>
 <1563827815-15092-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1563827815-15092-1-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 01:37:33 +0200
Message-ID: <CACRpkdbkLj7WDMp7vtNDR81yezw-zPq3MWvVRLKvpkvAueo0uw@mail.gmail.com>
Subject: Re: [v5 2/2] gpio: aspeed: Add SGPIO driver
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 10:37 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> As you suspected it correctly, AST2500 utilizes all the 32 bits of the registers
> (data value, interrupt, etc...), such that using 8-bit bands
> [7:0]/[15:8]/23:16]/[31:24] of GPIO_200H for SGPIO_A/B/C/D .
> so registering 10 gpiochip drivers separately will make code more
> complicated, for example gpio_200 register (data_value reg) has to be
> shared by 4 gpiochip instances, and the same is true for gpio204 (interrupt reg),
> and other more registers.
> So we would prefer to keeping current implementation.

OK this is a pretty good argument. My review assumed one
32-bit register was not shared between banks but it is,
I see.

The above situation can be managed by regmap, but that will
just a different complexity so go with this approach then.

Yours,
Linus Walleij
