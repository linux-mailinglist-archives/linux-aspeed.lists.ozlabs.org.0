Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA14B0C07
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Feb 2022 12:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvZ0Y2DGYz3bZc
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Feb 2022 22:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jbBWNeFp;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jbBWNeFp; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvZ0R5jMmz2xs7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 22:15:03 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id y17so8368275edd.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86WvMXZHLjkGbiJZp5ccobLzsZbB0pdZcrhUodCwW5E=;
 b=jbBWNeFpcaENFcXzIP+FtT16BHbVbBhNZ8K2JjRHALDwTKGfZd94WmyMuhUTeSVcyt
 t4TfJ4Ql6XAQ86Wy9jqNgMthktqHp8XwXmcrCUp2OMVrjjs7y9coNUd/tursxZzXQ1Cv
 t81NxiWRlVc1q6CIxQzv0DWYtfjlT9ATbIfXX57rjYiGEAx2NHTYoB5Kkqs+QEjwAC6N
 Cs/VMcgAcGHZnIToTNwxG/3ro+MnwBd5aw+55RhGytRlEmGamtSnTtGMi9lQPb89EI4U
 NrBj3LwMyti1KEPBaBLta2RaUHPUkcYy6CBLKyrTQgN6WRTx0ewpxkuqGxFlh/5vpGVe
 5TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86WvMXZHLjkGbiJZp5ccobLzsZbB0pdZcrhUodCwW5E=;
 b=f4Vodpbujlv+QhVQy/nIR/MuAfmxcjKNF2OPmR50I9KOGxZk6+nQULxYJlZH96dWm0
 5QAnThfeVo2Q529N/7PT6AUr3UtuKZseeGL5yqsPHjE5mjjuKIM8cvvpIz5TGeuovNSp
 6N3ydwZaB4QNNWlmZmRY1hFaTHyRMp5P9Ho+GcBLlwmj/voKbcy3i6Jipz7mWRml6LQo
 1wmdJt2x8DdsFX7dfV3DLXh0ul/HtJfmMBEEJSoLbwVHnsClAvV8qhZdzTvF7PcY4+IM
 al3tTRRjPIypvKQh9lVZSv1yhrbWPNu9qz5h6b3RCQn7JUoGlIsnhO/WcADQKhX3SkYM
 WKSQ==
X-Gm-Message-State: AOAM531NPuTqdEk0Yj96vrCW7Z/KR/DQkLOWbQBJ6OzVigVHRPPKBKqP
 TrAozCWCOwxramRT+S0JGz5wlP4qSk9EvEKXhuA=
X-Google-Smtp-Source: ABdhPJwt4DzuSAvUl6+QCoPSNRZVDryR+G7Pk+UnooBQRefAASpZeECFwgpI2N0KRWI9tN4IO2kRQIA5cNfNs1sDIhs=
X-Received: by 2002:aa7:c413:: with SMTP id j19mr7838615edq.200.1644491699638; 
 Thu, 10 Feb 2022 03:14:59 -0800 (PST)
MIME-Version: 1.0
References: <a0f3e5d6d438710413d1909365f99ae4d2a4bacc.1644399683.git.yang.guang5@zte.com.cn>
In-Reply-To: <a0f3e5d6d438710413d1909365f99ae4d2a4bacc.1644399683.git.yang.guang5@zte.com.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Feb 2022 13:13:28 +0200
Message-ID: <CAHp75Vd-Zszg1j6aVrX_oEJdiq4m=69JqE4RvyPMqEu30RFaTA@mail.gmail.com>
Subject: Re: [PATCH v2] serial: 8259_aspeed_vuart: replace snprintf with
 sysfs_emit
To: davidcomponentone@gmail.com
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zeal Robot <zealci@zte.com.cn>, Johan Hovold <johan@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yang Guang <yang.guang5@zte.com.cn>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 12:54 PM <davidcomponentone@gmail.com> wrote:
>
> From: Yang Guang <yang.guang5@zte.com.cn>
>
> coccinelle report:
> ./drivers/tty/serial/8250/8250_aspeed_vuart.c:85:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/tty/serial/8250/8250_aspeed_vuart.c:174:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/tty/serial/8250/8250_aspeed_vuart.c:127:8-16:
> WARNING: use scnprintf or sprintf
>
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.

sysfs_emit()
scnprintf()
sprintf()

...

> CC: David Yang <davidcomponentone@gmail.com>

> - Use the CC for patch sender

This is incorrect. The submitter must have (the last) SoB tag.
Question was about authorship just to be clear.

-- 
With Best Regards,
Andy Shevchenko
