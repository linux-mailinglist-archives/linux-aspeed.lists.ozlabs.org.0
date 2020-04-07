Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E93711A1887
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Apr 2020 01:19:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xjyy0gYFzDqQv
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Apr 2020 09:19:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=joSVl4H3; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xjym3pSyzDqyx
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Apr 2020 09:18:54 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id 130so1319407qke.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2020 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=arc0QwF9QkSbUYwece2kAdI0S4w2e8/g1Kg2BaIFivk=;
 b=joSVl4H3I2jYhGA+Vn8ARJtV17flaV4g5L4ydFwkGzaU4GKGFvvbA33H13/xHIoGGi
 IS8HLQ7QwG13HsWXu+MWcZp2sNzgpNZVje6mMr6PoJuvQ81zI3kZYI0lR3vleehqmKFO
 E+GcOu66YWlvOT5n/VkC5Fikld0uWFi9Wl74c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=arc0QwF9QkSbUYwece2kAdI0S4w2e8/g1Kg2BaIFivk=;
 b=V8Fj1iYPT7kG+/ygZaBkcEskmtvSOlMEWGrMS27dYb4isF3KqVoxVBhNZAdROlBfx0
 r34GyGlogtr9Y6Sco1fOgnDE0sPoUzKqHdaAgGk4+8ddYRaDT6W/rqSw3QUtEY+XKMt8
 f0raBJg8l/Q/M08lRY2JN8Tq1aAaNvzD/bW8JpZKdKfS/28BAD/4nj+O9W5tKP2UMnrn
 bTm0T8pmc6fa79fXETQ4ir9CmhcOjzEcIKfyvlFk5nTrXeGTo/SY2dnSZ04SxWO6z5pt
 KXWJ4PLfXsJcVjdLlVuttFZlQJwc9UuQpfpIgxW/tDvWMsUF357EjtcxsLtIzWwC77SP
 hmtg==
X-Gm-Message-State: AGi0PuZsUKnIHJ/hvq+ALTCpniRf1T0EiYhtqkYhQTyHSePXz5uvuLtf
 KhygUH13cW7uhNcY5WbmHOP8sIaOAFoPscspkvA=
X-Google-Smtp-Source: APiQypIlWOqiY3c2g2lCk10VKv2zHPQ+qXXZ0U8vk+OcVtVD3SHJ2bsOmTS2udT1T9Bm2A0alpCXLE1dDZOpotPlZn0=
X-Received: by 2002:a37:b285:: with SMTP id b127mr4735607qkf.292.1586301530231; 
 Tue, 07 Apr 2020 16:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200407122149.GA100026@mwanda>
In-Reply-To: <20200407122149.GA100026@mwanda>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Apr 2020 23:18:38 +0000
Message-ID: <CACPK8XfA-4WvgVeEKi-hdC-LgEcicEhpV_0ivwymaEJKy15hGA@mail.gmail.com>
Subject: Re: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 7 Apr 2020 at 12:22, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This needs to return the newly allocated struct but instead it returns
> zero which leads to an immediate Oops in the caller.
>
> Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix Dan.

Andrew, I think this means no one has used the v1 bindings in
mainline, so could remove that code?

> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 9422d55a0476..a140203c079b 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -271,7 +271,7 @@ static struct kcs_bmc *aspeed_kcs_probe_of_v1(struct platform_device *pdev)
>         kcs->ioreg = ast_kcs_bmc_ioregs[channel - 1];
>         aspeed_kcs_set_address(kcs, slave);
>
> -       return 0;
> +       return kcs;
>  }
>
>  static int aspeed_kcs_calculate_channel(const struct kcs_ioreg *regs)
> --
> 2.25.1
>
