Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AE53E126
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 08:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGkgS003Hz3blF
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 16:52:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIzsttLL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIzsttLL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIzsttLL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIzsttLL;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC4xT06JRz2ynh
	for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 18:21:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653985288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2fPIOlCOM3E2ayUp2iBt+EP7fcwTmAstFfusjqDQsU=;
	b=HIzsttLL1cqIPRTOYpfyEj7Tair5lPfy2WDn2+PpWZ9GfPDNsgJOp2mhpQJXSab5UNi3kG
	K/jDbNLhp29hJ3V3JSEh9xjrJgtWJQddhzcfYBlbZS+yS6seLSlD0TVQqnYcFDqqdnd2cL
	E1cT2giCdviURuPxpohz5nvLRmQy8G8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653985288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2fPIOlCOM3E2ayUp2iBt+EP7fcwTmAstFfusjqDQsU=;
	b=HIzsttLL1cqIPRTOYpfyEj7Tair5lPfy2WDn2+PpWZ9GfPDNsgJOp2mhpQJXSab5UNi3kG
	K/jDbNLhp29hJ3V3JSEh9xjrJgtWJQddhzcfYBlbZS+yS6seLSlD0TVQqnYcFDqqdnd2cL
	E1cT2giCdviURuPxpohz5nvLRmQy8G8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-8vePQYEmMH2m8SW3yThXPw-1; Tue, 31 May 2022 04:21:26 -0400
X-MC-Unique: 8vePQYEmMH2m8SW3yThXPw-1
Received: by mail-qv1-f72.google.com with SMTP id eb5-20020ad44e45000000b0046447caa7a0so3923722qvb.16
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 01:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I2fPIOlCOM3E2ayUp2iBt+EP7fcwTmAstFfusjqDQsU=;
        b=f3dcSMu4MU2oxhzEk2NFRNRIRg55gIHmX8EyAW1DDFD9uL8PtvNHmQky+KWOvKLaoN
         IDfufWlRrCyfJNhoHnB9xdbcrv1kDq6isTE7MQy8H0fOIq6zn4KTrmAdgDHp6TjZYvIv
         Ar361PR6k3ZIglt9v8ruqcrn6OzlXxX3hYdmcYnGHDdFa5FpagWGl3Np0+8ER7i+nO8L
         wRKWEpkcUkVNoUeTGZ7AvCCQtVeakvtrC9YK3eSuWq7zymbYtLDfSqmtTK8uGAcghvXL
         cGj/7UrNs/KuUc1D4PKPSfl81mpfHmTa/KFI20B62O525W/G9fR+AZXeu4/6rW2q6/V+
         pXPw==
X-Gm-Message-State: AOAM5312wj/QOgi9NxNydq76ChwFWon4tbx+jO+TOYZbcQBRyn9UqqI7
	7WVk/od8O4J3KiWYuysGGqQVO1mLrF2wvl99GNvK7e/U1M5ys3ZMuB5C8gTJLcCKbbCwOwD6G60
	7sq0i6jvyQIWNDE3i1iErjzU3aA==
X-Received: by 2002:a05:620a:48:b0:6a3:5595:9d1c with SMTP id t8-20020a05620a004800b006a355959d1cmr34608322qkt.246.1653985286349;
        Tue, 31 May 2022 01:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Elviq8wkR7QEM12lazPriRbiYCkorY6f8q5VZxEiIzIY4yeGkiflwejzp+2iiEkHKHnqCQ==
X-Received: by 2002:a05:620a:48:b0:6a3:5595:9d1c with SMTP id t8-20020a05620a004800b006a355959d1cmr34608311qkt.246.1653985286083;
        Tue, 31 May 2022 01:21:26 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id p20-20020ac84614000000b00301729af618sm4758636qtn.97.2022.05.31.01.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 01:21:25 -0700 (PDT)
Message-ID: <48cb78ebd38dfe4ac05e337d5fb38623b7ee0e8f.camel@redhat.com>
Subject: Re: [PATCH 1/2] net/ncsi: use proper "mellanox" DT vendor prefix
From: Paolo Abeni <pabeni@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
Date: Tue, 31 May 2022 10:21:19 +0200
In-Reply-To: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
References: <20220529111017.181766-1-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Jun 2022 16:52:00 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

On Sun, 2022-05-29 at 13:10 +0200, Krzysztof Kozlowski wrote:
> "mlx" Devicetree vendor prefix is not documented and instead "mellanox"
> should be used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  net/ncsi/ncsi-manage.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index 78814417d753..80713febfac6 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -1803,7 +1803,8 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>  	pdev = to_platform_device(dev->dev.parent);
>  	if (pdev) {
>  		np = pdev->dev.of_node;
> -		if (np && of_get_property(np, "mlx,multi-host", NULL))
> +		if (np && (of_get_property(np, "mellanox,multi-host", NULL) ||
> +			   of_get_property(np, "mlx,multi-host", NULL)))
>  			ndp->mlx_multi_host = true;
>  	}
> 

I can't guess which tree are you targeting, devicetree? net-next? could
you please specify?

thanks!

Paolo

