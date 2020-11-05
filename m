Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3572A81D3
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Nov 2020 16:05:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRn014SBpzDqCK
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Nov 2020 02:05:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HsiXs0VE; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJn1kDnzDqSC
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:14 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y184so2570618lfa.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
 b=HsiXs0VEUiEakbq3EXNQB/5+Q3y+7iqJsjnPA/Kth42Zs/uHRmD5ehYw+sWkcRqdRx
 L5FwizhETXi5cQBx+5LZ2BYMCgD7y341SmxGtQ0lyOipTVgC3nWqfSF4VYBzE0EmnSOH
 x17U3045IcT1LhWp3h/DtNF5qBJWlLCVS97E3FwUFhegzvIAyoa27/NhndNMO6Ohy7/i
 clz0AfYWo+OvOakT64KFovD6uvi+EXrJdBp2HAUUEui5OnJ9nwmNyCY1liq3bxrFqM2f
 wn7XubM0JOg3DfICI0O1voKT6Rms9hSTr0UR13OODY+xroSdkZ/bSDlOBZ/XfgZZ9P5x
 4MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
 b=XTOoKL4ylfEIXD9zSxEH61yjGXewcnyC6+evd1I7Np3iabAymYIk/Hjc+iYH/Frlqd
 z7TXU29c4r7TJcKMt6nmwn5kIqSEgMEIIVuZvdOhUY4JUN+HSm+dxAZTFIPU424baNLL
 +hJU4GerNL546aZ/KTW9dXgYnxzRZU+xMSc9qfWBGtE6ZrPVQpaR6Ai0cnq/JagfPgLQ
 xfghFb8nti+k2eiIN+4euIMXl7/uwJ4+Q8927+HxUMUVX8I/62aREaifbOAn5q/fdain
 +OmpbQ2qyxZ+6h2iD5kz1Q23c1abKXqOklWF1X4h7jqN0NhoQ8PQPE71HKDh4OdEgvp9
 i7qw==
X-Gm-Message-State: AOAM532g90MBvMArDom14CGy3XXycPzBcAvaUA0owYpPgbqnEnGA6IkR
 L3L9eEqozX2jAftCPxdowsQol4qaUOvTMqm3No3GYg==
X-Google-Smtp-Source: ABdhPJwi4+FDtHZuNaZ2D07E95crUVSI4V31HmhkquL7JVxvR4IkomX9YeN0u5y/BL+pxjnLsc2vjrD0BOna3+dEwDk=
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr1037730lfe.571.1604586909849; 
 Thu, 05 Nov 2020 06:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com>
 <20201030055450.29613-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201030055450.29613-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 15:34:59 +0100
Message-ID: <CACRpkdY+oOWoEVEn8ECckYkUcDUJw2Ts4JMAu0bCbVxs3WNvZg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix GPI only function problem.
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 30, 2020 at 6:55 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Some gpio pin at aspeed soc is input only and the prefix name of these
> pin is "GPI" only.
> This patch fine-tune the condition of GPIO check from "GPIO" to "GPI"
> and it will fix the usage error of banks D and E in the AST2400/AST2500
> and banks T and U in the AST2600.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Thanks Billy, patch applied for fixes!

Yours,
Linus Walleij
