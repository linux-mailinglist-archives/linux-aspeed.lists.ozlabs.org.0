Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9D4AEC25
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 09:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JttCr4T3Lz3bTS
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 19:22:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IhXDd7OG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IhXDd7OG; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JttCj0jmgz2yPv
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 19:22:24 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id ch26so3407891edb.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Feb 2022 00:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpQU7MwvnnmzkAtetNTBKBwEhnc+PKqXnl8IukTROIA=;
 b=IhXDd7OGarp3eySx5bkZfw12VJDhaOaz7OC5hMX1/gqGa7Kv64i/UfuFWYOZ646SMC
 +COGlUX3M8SLh5qgaI138hDe5mHFI1ah2h7Ya68sA5Q7NyR5UNd88Cq+eFVzeZ0Of76Q
 N79j63SOMOlONqN/c5Vnjih/sDEW67NcDoHTdj80hEUuU977wg/Ju+LaEfTp+Nh/xPIg
 gXvQUAdJ15BHg5TDeROrmqmxo6PYPCBvlKC+wU5FTqSMf6SlivQeu9IoTBM6O9QBFqjB
 TaFiiZFMvdRL6qTgtEccmtyHtpgbNJKnaQw8U76C9RzU7NLskUOUdEI0p0ZrQRJ9NLkj
 JrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpQU7MwvnnmzkAtetNTBKBwEhnc+PKqXnl8IukTROIA=;
 b=rujntC3ME8HlgiLPozTLDTmJkJgsBrVhrTIaDW7DAZe5CezaWLH0RL9pL8sSZAuJax
 sfFo64bkmDtL2ASBkvqn7EoFvszysU5BMtNZLkq+iEHKNALIdw9FihcRjC2XdEvg9wRQ
 5iLDB25+WXIaD7D0YsMv1NxcSnpJCWM5z0wyx0JZvqRrdZw02s4546viNg9mMqRHwOip
 zGytOv6JJnxK3zdTL2tzJTYditgGm9VaTxwJaEvcDAiobGqKrDcJwij+OwbRAk/GOau9
 qLeVeKvuZtNs0E+xJWi3wlTbV0WcDHkpYd5XsapAS2BEQnlGTIivtgPt2Ug4XK8NqUz7
 TDAw==
X-Gm-Message-State: AOAM533vSHphu0ftwfUEhD9qp/cxhCOLHMN3qHzpDZQG9EiFEe5VcuQz
 5WeN5KIHAu9RQLd61SD6rBZ2EtYGq1cHJWtegPM=
X-Google-Smtp-Source: ABdhPJxgbIM9HkQTeMr8qIeIvkRgzKugj11n3DUKBGJfOENttEguf2tvMkGSkDAJKiQ90eexactk/erkyNtZaQFulHQ=
X-Received: by 2002:a05:6402:4254:: with SMTP id
 g20mr1242666edb.281.1644394936606; 
 Wed, 09 Feb 2022 00:22:16 -0800 (PST)
MIME-Version: 1.0
References: <96f0e23f49d708ce2476a6c19867443a48d78f65.1644283006.git.yang.guang5@zte.com.cn>
In-Reply-To: <96f0e23f49d708ce2476a6c19867443a48d78f65.1644283006.git.yang.guang5@zte.com.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Feb 2022 10:21:40 +0200
Message-ID: <CAHp75VfQMkb0Ek6HG_FL+4OJV91=nd3QKjYFCobQPCt5PzdASA@mail.gmail.com>
Subject: Re: [PATCH] serial: 8259: replace snprintf with sysfs_emit
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

On Wed, Feb 9, 2022 at 9:24 AM <davidcomponentone@gmail.com> wrote:
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

Subject should start with "serial: 8250_aspeed_vuart: "

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>

Who is the author(s)?

-- 
With Best Regards,
Andy Shevchenko
