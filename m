Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B092A226B
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 00:51:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPXrj6YzNzDqQd
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Nov 2020 10:51:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=b1Id3H4j; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPXrY1WkdzDqQd
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Nov 2020 10:51:37 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id j31so1458823qtb.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 01 Nov 2020 15:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjQD2FJt/p1aXqCjeUIaEOa7xOIXTB8pAOJ6QQztop8=;
 b=b1Id3H4jkhJ3xK1NoPl7aIn+eWY5FW2UZyv10J19sCuNBkM7CaQX1T8mFon4+EzffP
 5IFO21rfJf/tyN9NLTsNb9uCoLEOz6uITP0BTLp93Ar0QmYUlJjB9ClOBeeMgN/ro+Dh
 m5Ag7mRzr1kpUArwtuxqOQQqG+EwDuNjyZj+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjQD2FJt/p1aXqCjeUIaEOa7xOIXTB8pAOJ6QQztop8=;
 b=HYtqFhTpxAoq7rYqmrwXw13PD3xMIft6tHpHkqM5VDwl18t0FiNF7XecoWloUnJNrC
 549tLKdwOu/1+T0iAzxpZJz7kQzBoOdhO4Z2hUVQ3yoL3eEpQcMumm1tEto7ioxKU82X
 xcBmiDBzUqOTTHmYtGA98RDyzENkHMpafh3L8UR2Hsm/gcJ0o/8bZPZbIK6sb4vSa0Mb
 Zo/7QDquGbVnN3U0KUzzU+nh/dODEamNl4bPPh9cxkzz6dyzmTTm09hoxzlLGvwv9XTv
 DJsGukDsQuDYKecQsRA60lBw6w/HJ7PbH2vFs87BU2Xb154S1enfKFCTKoAdLOC8sBXY
 u+6Q==
X-Gm-Message-State: AOAM530wT4h8WV871Ue1WW2sEL/Igq4AIRdZpIt/Bjf6Qa7C2EwDkbcD
 56ItZtpNolGYMFjsZRWb6hHiRehu8SX5HovZSzw=
X-Google-Smtp-Source: ABdhPJwiVHw/di++bwpzmmsiMvSgsPlnOQMUoMnFTazlwfgRtckY5/nFThGgOIM+IhkIj0ohaNX4vWjC2HAKvYpiuOs=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr12007972qth.176.1604274695580; 
 Sun, 01 Nov 2020 15:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20201101150622.2288203-1-trix@redhat.com>
In-Reply-To: <20201101150622.2288203-1-trix@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 1 Nov 2020 23:51:23 +0000
Message-ID: <CACPK8XeCJpbh+F4EzfmGJRt2JJHPjKGK2dyqF9BV_NUFYgc=nw@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: remove unneeded semicolon
To: trix@redhat.com
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 1 Nov 2020 at 15:06, <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> A semicolon is not needed after a switch statement.

Thanks Tom. I will add this to the aspeed soc tree.

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
> index 26db42ef6aae..20a1d4aeb051 100644
> --- a/drivers/soc/aspeed/aspeed-socinfo.c
> +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> @@ -51,7 +51,7 @@ static const char *siliconid_to_rev(u32 siliconid)
>                 return "A1";
>         case 3:
>                 return "A2";
> -       };
> +       }
>
>         return "??";
>  }
> --
> 2.18.1
>
