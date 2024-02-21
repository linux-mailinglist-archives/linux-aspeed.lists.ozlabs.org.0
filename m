Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4D85E694
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Feb 2024 19:47:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/MjfifO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4yT06fwz3d28
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Feb 2024 05:47:29 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R/MjfifO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=f.fainelli@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4yN1GPgz3bx0
	for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Feb 2024 05:47:22 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-68f9e399c91so9749396d6.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Feb 2024 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708541240; x=1709146040; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q7SIaGYdisTVbA/n7KzE5hLJekskq0uRcaV69//27Xg=;
        b=R/MjfifO7AJzqpNLRveO/xCZ+Am9m1ZQ8wCbxqYlNRNb8KB0ozG/4lsuOP44UTQPLq
         A77NWTmxxqak4tX3vA1pOgpTDwv4XbPtjz456AmWyXGO32H2MsFWDSuebsfUmCzMZqtd
         JTP+Q5fP5i7Rfo9SsNJ67pxl02impfogdgk/pMkyMM6eweOUeIH6FFv2Ng/ZK2DaalGQ
         X0mxhtBl2jxEM3G5+GkS6ym3+eyU601tNa51yMBVmd+VMjUIURtwxllK5minBfG4Fs0o
         qRiiVFM8yGVNZo+gVa/JO+ywgh0t9eiBlzades/JnJiTy52+0Hsn8KT0spp/svZrRZgt
         QedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708541240; x=1709146040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7SIaGYdisTVbA/n7KzE5hLJekskq0uRcaV69//27Xg=;
        b=eORUBzqTKMiwL2gg4aij2Dnt9HerB7HHy6s62H1uVFqMPdo0kxfqj+GnurjKneTXyt
         7SOc3ll0PHNA62NMm1TY3celTtsOWxX6IGi7R2dfJFxjuNZOQQ0cRyH4eCnz/fEnZ/QS
         gC8QxmQwJB2pI1iWUjdO+xgndIBa1ndHi2psHDYLM/MXTZjh1F0vyr4gRzHUvhiz219l
         +iOP9ducWAKDd+mO1UiR6cuxesYgtyqB1zndlP1xSawu7PFXiOYWiJ+3zGAV5JKr9SDN
         xkPC5pSUY/3Y61gPmdhBZKfoQ+AAIW4GTeEzlEtHWpltOriecyWvbNkeWkvHnbYVc17C
         ZN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEVuW4SOr0BUf40NbKKrloZ50ureDmwH2Z6sJlcCG8nCf4c22jYuZBiBxmVGuaTCCPOCg07h4GezrlJ6UGLLl4pkkpnqJX6d3MW4SSIA==
X-Gm-Message-State: AOJu0YzIalHMWsu6NVSJzHWhl6Z8K/h4qrsIKCsfnVTUyGEvHytIRoPe
	baEsimOSqvQdMfNfNhGZUnkx0jJeEaeggTcDbgiTTG6XMaIJ5uup
X-Google-Smtp-Source: AGHT+IFdbZ328wwAUNMxAd88W261f5wjo6+4Kn7PQaQtkczXw7PuuAqsGk3SFKLmDE8GyF5oAKU83g==
X-Received: by 2002:a05:6214:2a48:b0:68f:3f86:c2cc with SMTP id jf8-20020a0562142a4800b0068f3f86c2ccmr10584099qvb.59.1708541239928;
        Wed, 21 Feb 2024 10:47:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id lr10-20020a0562145bca00b0068c968c3b33sm5759444qvb.20.2024.02.21.10.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 10:47:19 -0800 (PST)
Message-ID: <d18d4488-aa48-4156-8087-a117664cea7b@gmail.com>
Date: Wed, 21 Feb 2024 10:47:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] serial: core: Add UPIO_UNSET constant for unset
 port type
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20240221183442.4124354-1-andriy.shevchenko@linux.intel.com>
 <20240221183442.4124354-3-andriy.shevchenko@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240221183442.4124354-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Scott Branden <sbranden@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>, Paul Cercueil <paul@crapouillou.net>, Thierry Reding <thierry.reding@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Jiri Slaby <jirislaby@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 2/21/24 10:31, Andy Shevchenko wrote:
> In some APIs we would like to assign the special value to iotype
> and compare against it in another places. Introduce UPIO_UNSET
> for this purpose.
> 
> Note, we can't use 0, because it's a valid value for IO port access.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/linux/serial_core.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 2d2ec99eca93..2b0526ae1fac 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -470,6 +470,7 @@ struct uart_port {
>   
>   	unsigned char		iotype;			/* io access style */
>   
> +#define UPIO_UNSET		((unsigned char)~0U)	/* UCHAR_MAX */

Nit: I would name this UPIO_UNKNOWN, or UPIO_NOTSET, unset means to me 
that it was previously set and we undid that action, whereas unknown or 
not set means we never did.
-- 
Florian

