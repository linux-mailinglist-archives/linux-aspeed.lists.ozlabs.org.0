Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B4399F7E
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 13:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwjkf6W5rz301L
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Jun 2021 21:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F5QtRXmZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F5QtRXmZ; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwjkb5g23z2yxy
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Jun 2021 21:06:13 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id e1so2668654pld.13
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Jun 2021 04:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ENLbFd+69Y0nrnJCUItoGXO9C5A4sDHjRpfSagYL0Ko=;
 b=F5QtRXmZFb7NwQQkmFmgGvzp2WWX1Ixug6Zeg+t2AH9OnAcH+cl6GizbK1s3CMBlMD
 chxLoJM2z32lx0/iKvl5XTK/wS6JXauqD0bAh8+Mj7YO6kZGpa9VHS3PvhQfPcJLCe2F
 3S9szbHfuhTmTGaeJPHUQ+6xcQmEiKE6GAP/tzZm49HSSBzA17XM7F75jKYEBFgLI8p9
 mvXEdonE89fUt4FBkUZHApLur+tBGpzL5MLUvpiZH90iv3QpFg/4OeP1M7kzsikHl1d5
 Qgc3R4OWZvKBuPJT6OO/Li4zTeWcBpYqDqT5Lqxe5QJk/E3+yb5JnQIl7BACwXPXslNk
 ovSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENLbFd+69Y0nrnJCUItoGXO9C5A4sDHjRpfSagYL0Ko=;
 b=Xxn7qjSpN9xKGxWgQH12Y7IV71lxhkf+D39FlURnCKp/KL9k+AOjf+7u/6sByQeh4J
 Ilo3UXuo3tzZz224ImLcOzQEFNJDbU4oy2otvL/BU1luz2h+cP7aPRK+kbqh3bK4Cmsa
 fB3qKyaTnIrxRpWNQ/IDK8U68zuBwMJx8OvdaVPjSBeQNlFtufXCpzowhXDpB9aqFXW3
 NAaMNCcWlx+yLnRk2kgwr3AWHNEkQnHkzoDYPu1WIS07UoZYCY0LsHXhhf3fJ/4PKB7S
 wENkynhXSsVoiZfwmyFoe2ZiZ2FT60D/rWWNyat5hJbK8EFHrFhkeAPYv0M3vmLnlxoq
 e7Fg==
X-Gm-Message-State: AOAM530dEPZrhjToHSrxJNpwmWokqaWOyO+U9Pvqzsse/hfb+ExP6LHO
 trpoAQS+rRkFYANWdzir7/e6amb3Blb26H3hwoM=
X-Google-Smtp-Source: ABdhPJwdBL2z4L2+Wc/ypiCeWfr+P8eVqMmubLXTKRDec5XtGid3Q4+2xbH79lJMAgSDdFdV0ALw46qnoA/yXj0GJ4E=
X-Received: by 2002:a17:902:b205:b029:105:cb55:3a7a with SMTP id
 t5-20020a170902b205b0290105cb553a7amr17392850plr.17.1622718369356; Thu, 03
 Jun 2021 04:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
 <20210603101822.9645-4-steven_lee@aspeedtech.com>
In-Reply-To: <20210603101822.9645-4-steven_lee@aspeedtech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Jun 2021 14:05:53 +0300
Message-ID: <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
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
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> In the current driver, the maximum number of gpio pins of SoC is hardcoded
> as 80 and the gpio pin count mask for GPIO Configuration register is
> hardcode as GENMASK(9,6). In addition, some functions uses the hardcoded

use

> value to calculate the gpio offset.
> The patch adds ast2600 compatibles and platform data that includes the
> max number of gpio pins supported by ast2600 and gpio pin count mask for
> GPIO Configuration register.
> The patch also modifies some functions to pass aspeed_sgpio struct for
> calculating gpio offset wihtout using the hardcoded value.

without

...

> +#include <linux/of_device.h>

Why?

...

> +#define GPIO_OFFSET(x)        ((x) & 0x1f)

GENMASK()

...

> +       pdata = of_device_get_match_data(&pdev->dev);

device_get_match_data()

I guess you may replace all those of_*() to the corresponding
device_*() or fwnode_*() calls.

-- 
With Best Regards,
Andy Shevchenko
