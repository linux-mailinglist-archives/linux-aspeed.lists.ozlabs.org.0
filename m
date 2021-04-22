Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1853682D7
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Apr 2021 16:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR0qt6MDvz2yxm
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Apr 2021 00:56:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=XOvY2HS1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XOvY2HS1; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR0qr5Ct1z2xZy
 for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Apr 2021 00:56:40 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id 8so12801274qkv.8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Apr 2021 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9cZAWfImI6VLS+4QpAMj/1HbaXFkUQw52F6CC9VLM0Y=;
 b=XOvY2HS1G58unBxLg5ROQPBVXB2i1rtoWGc+bbXT+2vA7bCspRWZdgzAaCCZ0bsoeu
 0sF56VPYV5WfWMwnmZ3Wxy5UtjMzcrDiAqmNu/dR2bYadmmTBLf/iSiXxEjg/GGXuOxB
 mQDhMr9mzdoN6BH9LnOyrOJ8fRZwMpWjD26p+zcqf+J13OviGDOMnBODvZfMg016tALI
 qiyv/x7QuuGB5CZjIlcz701ylLLjRKDmO9O8eprkW2MllSn6Yaui2gI1s2o7s34ux3QI
 jegryPdr6Ar6NzYc3zJu60EBIyHDyIOrzPCcVgX/dgaHH1JrLhbUUe+0XNID6kKlHUJr
 3WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9cZAWfImI6VLS+4QpAMj/1HbaXFkUQw52F6CC9VLM0Y=;
 b=k62byi0m9zvlcUcWLOxu4YTx2JMuFvaRYHBQVjLfVoH24o4NvIfF7PjTDTIDd3m0Ij
 6edDIcjBsN6JV3LK4B7VcAQc/nr620wEfBxDaBDwIvLJ57eCIybaXJKI+NfUEq7F1vXE
 XLBJYJOjlrrfGr1MZ7WtPdswwOSB39XBhpxRCwmKiawG8hyZjl5lqptTlXu4dyOX8dXA
 Cfv3Pfi336cNJdUY017UOMWC9aVbvI83/XxPffk+Y6nXROdGWCCn+8glfLTxvcSfbosp
 hDBR9ZkSBh0nKpjA7B9OfK6rXu4/hn7d+lWjlVYy1pEn6tXjFaUvU8y/G5KS/QghbwY6
 mtRA==
X-Gm-Message-State: AOAM532+P78z1ZVhSZtuOFWC8fvATmMkYeXYYjjSDTRGaMIPJOqv4X49
 5sk23hG5jZFAspAECLHSnV9E2WOmhzj8Izoj79ksHg==
X-Google-Smtp-Source: ABdhPJxFW03kYV1p+C7svvmXCA8kbvcMHwdxhGDs5AuWcLYnO3Ok1b8fiJ6ENnUdOk4iCG1afoKrJZRnyTQwB3rWzc8=
X-Received: by 2002:a05:620a:52d:: with SMTP id
 h13mr4127770qkh.472.1619103397954; 
 Thu, 22 Apr 2021 07:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <YIE90PSXsMTa2Y8n@mwanda>
In-Reply-To: <YIE90PSXsMTa2Y8n@mwanda>
From: Patrick Venture <venture@google.com>
Date: Thu, 22 Apr 2021 07:56:27 -0700
Message-ID: <CAO=notzLH4reOAVu9t=81th+dS52BvBURKveHbg4wDjbdhbH5w@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Robert Lippert <rlippert@google.com>, linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 2:12 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
>
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
>
> Fix this by removing the ternary so that "ret" is type promoted directly
> to long.
>
> Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> index 210455efb321..eceeaf8dfbeb 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
>                         return -EINTR;
>         }
>         ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +       if (ret)
> +               return ret;
>
> -       return ret ? ret : copied;
> +       return copied;
>  }
>
>  static __poll_t snoop_file_poll(struct file *file,
> --
> 2.30.2
>
