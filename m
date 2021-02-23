Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF47322960
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 12:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlGlJ0ZF5z3cGp
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 22:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RzmUtKDC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RzmUtKDC; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlGlD2Y1Lz30NC;
 Tue, 23 Feb 2021 22:18:47 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id s15so1726459qtq.0;
 Tue, 23 Feb 2021 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VV7rEIve6yKGpkMRY5hUYwZ7RTxYrpNXrvLCtfvfuXg=;
 b=RzmUtKDC7CFuAPBTb7dsBZ1dX6XfNmRs/2DfC1ACIN3taC6QwxcYqjuUCkaqT/FmHp
 RZm8vt/wPryOa+vCnT6Is/iWpucbeyJROoZnGWdCdOgIbUL+ac6CMR85zZ/8un3eVDYy
 hVfwIRWlkdbBFZ0lF6SKe7WdEmfB1EgtLrOSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VV7rEIve6yKGpkMRY5hUYwZ7RTxYrpNXrvLCtfvfuXg=;
 b=NIU4A1Jnh2runuN7V+NO2aLnRGd6TMWoM0yL40spnhG3eUFQjrQ3t0vAk9mhsbF2LE
 7CFPXdHYNFahm1jX82SfYtmFq+aHH3AQcS9RvfLJS9XoqpcYE9h7XDz7rnHz7jXYdCH3
 NP7yAqfmPWT4nXnCv2lNJdb2NS2bIXBFp421oXIaJvQZLC/jMzXBBcrq4b/4PZwkrk4p
 mqzEeTpJlgI//jU5Vfiv7BXi2ft7VlSd6L3IZMeETsRAJY69FBG06w0pOfefWI102Mlb
 +eJCBaIx0BH6Qs9/nxzSPl1UeVCqG7NI7XxDnyOKn5XA+5bkqUN4wovaZ7VVTf0fnGS/
 mYdA==
X-Gm-Message-State: AOAM5317xu2Kml/PINtbUPHYzNipbbjfV4VXU/UiPued7p6H4Co4Gd7F
 YLJfCdkyHjpZ4Y73YYrTxkdeOyO/yuve8QSWM3I=
X-Google-Smtp-Source: ABdhPJxAlqNlBFfBiQeyjUiNfVYmAYsZbURb6MXd2/TmhTdms/rgFCRvOm6E5N3wwEesKB9w7do60A/zBEzwkJXA8SA=
X-Received: by 2002:ac8:7599:: with SMTP id s25mr23612473qtq.135.1614079121544; 
 Tue, 23 Feb 2021 03:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20210223020925.22856-1-dingsenjie@163.com>
In-Reply-To: <20210223020925.22856-1-dingsenjie@163.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Feb 2021 11:18:28 +0000
Message-ID: <CACPK8XeYaRkgWfG33+3ohCPKupqCay0jPp85hdt-XybWvM1eRA@mail.gmail.com>
Subject: Re: [PATCH] i2c/busses:remove unneeded variable: "ret"
To: dingsenjie@163.com
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dingsenjie <dingsenjie@yulong.com>, linux-i2c@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 23 Feb 2021 at 08:04, <dingsenjie@163.com> wrote:
>
> From: dingsenjie <dingsenjie@yulong.com>
>
> remove unneeded variable: "ret".
>
> Signed-off-by: dingsenjie <dingsenjie@yulong.com>

Thanks for the patch. Instead of removing the unused variable, I think
the code could be improved to return error codes when the recovery
fails.

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30..efad900 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -175,7 +175,6 @@ struct aspeed_i2c_bus {
>  static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  {
>         unsigned long time_left, flags;
> -       int ret = 0;
>         u32 command;
>
>         spin_lock_irqsave(&bus->lock, flags);
> @@ -232,7 +231,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  out:
>         spin_unlock_irqrestore(&bus->lock, flags);
>
> -       return ret;
> +       return 0;
>
>  reset_out:
>         spin_unlock_irqrestore(&bus->lock, flags);
> --
> 1.9.1
>
>
