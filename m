Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EC6488C2F
	for <lists+linux-aspeed@lfdr.de>; Sun,  9 Jan 2022 21:05:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX7HW3xRwz30Nb
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Jan 2022 07:05:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IHd5MFLN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IHd5MFLN; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX7HM12qGz2ywZ;
 Mon, 10 Jan 2022 07:05:32 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 h5-20020a9d6a45000000b005908066fa64so12234289otn.7; 
 Sun, 09 Jan 2022 12:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z/CHwmtPKS9YFQVceEU95L1dygwbhvLKGuEbY6OKojw=;
 b=IHd5MFLNDrqtGXbxIRYdAMF6VuHEEgWIHaubTyC3bxHwpEm/a4O6aZDlDgPv98IAcF
 zCqNbQqHdki2UyU0+VWoL9x1xQQm0UfnjLIPq+yagCnur9E2LeZt2vuGM0uZ8Ao4rcQ7
 LIqIjlp0jDc5gEmiiqBklfNdUVTt0wCIQ4jCwMLXibEhnv1BlatIM+K0+wiEEpGvEjte
 QjXJRGLHLx/6ANL43WG4iaA7G+f5WhN0l9TZdICklewsdqGuabEPOPhjZwmyH5T4QSPn
 5df73ZZJbEnxmULQhsAvVLd61d9Fc/W9AwuYWOEyP0uD40xf/td0jCGpbEF+9EVKgMNx
 v+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/CHwmtPKS9YFQVceEU95L1dygwbhvLKGuEbY6OKojw=;
 b=YrxdKaskoWap6Erelc65M/XgG+m1k4Qpj5gOiXSZaRdMhs2302zk2ZO4qNWyeatNU9
 bWKhz9pm5VbuQfd7XbgiVRumG6STAsNHs6YJ6X5Zrl6KuWvij94QlpUeL24e+8PIEHAZ
 6VdUGw2XBbT53X3AhnYXIgymGQSXudTqbC6Ru4FMPunIKJWeariBrSqiPD9vOvrP03Bo
 aW2v0iAUrrBmjAAnis0ZTuLExmACQvHX9BGwHMZkdsDar7bp0f/hV1TND4ysyZPcNajv
 MxUUS+iODy8rM2KU4OisMXQh9LZ1NJ6ogFOJlv6cIdeQFddEb1L3R3vOMwLuwFLsS2+9
 lRqg==
X-Gm-Message-State: AOAM530ehMMicN2tHvz5ByFHtESuQZihpm8KLn6lpkysXrOg1oqLLLA0
 AqLgmfIuuyPsz3NcuE6RhX5hOZMzfZs=
X-Google-Smtp-Source: ABdhPJxrW6dSPmq+6bBqrHhbGEkt++JXBn2/b6USAeH0BnRFnTJW52SXHZXOimNZzUI1sZ5hZpT4Sg==
X-Received: by 2002:a9d:75d5:: with SMTP id c21mr50145659otl.201.1641758729265; 
 Sun, 09 Jan 2022 12:05:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i27sm1070319ots.49.2022.01.09.12.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:05:28 -0800 (PST)
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Alistar Popple <alistair@popple.id.au>, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <3b5c9b693749a956b525c54bed0eeac9f958b8e8.1641734402.git.christophe.jaillet@wanadoo.fr>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] fsi: Aspeed: Fix a potential double free
Message-ID: <5ecd3555-092c-e11d-deb4-98da7c0e3e01@roeck-us.net>
Date: Sun, 9 Jan 2022 12:05:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3b5c9b693749a956b525c54bed0eeac9f958b8e8.1641734402.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 1/9/22 5:20 AM, Christophe JAILLET wrote:
> A struct device can never be devm_alloc()'ed.
> Here, it is embedded in "struct fsi_master", and "struct fsi_master" is
> embedded in "struct fsi_master_aspeed".
> 
> Since "struct device" is embedded, the data structure embedding it must be
> released with the release function, as is already done here.
> 
> So use kzalloc() instead of devm_kzalloc() when allocating "aspeed".
> This prevent a potential double free().
> 
> Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Keep the release function which is correct
>      s/devm_kzalloc()/kzalloc()/ instead
> ---
>   drivers/fsi/fsi-master-aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 8606e55c1721..ae6319818b14 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -542,7 +542,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
> +	aspeed = kzalloc(sizeof(*aspeed), GFP_KERNEL);

Unfortunately it isn't that easy. error handling in the probe function must take this
into account and free the memory. Looking at that exposes another bug: The
failure in opb_readl() should not result in a direct return but disable and
unprepare the clock.

Guenter
