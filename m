Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DFF762F
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Nov 2019 15:16:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BXxB31hqzF4m5
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 01:16:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcidApTO"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BXwt4lRCzF4jF;
 Tue, 12 Nov 2019 01:16:12 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x28so10787005pfo.6;
 Mon, 11 Nov 2019 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=febfKlWJi5gGxYdmeWZw4Fi5Cx8ThIzR9wUIWuDizCE=;
 b=dcidApTOUPNVuSFDYFLRSDVmUaujchonwjxB3OPh3A8fUBSMjJ1VijN6wTxjziztJ3
 mMfB+A9a6kbau0dpDL15pcCI4gsrXB3ITA0mQ+ZxnFb/ql20jhYY1ZjqWVhp40kaQz1o
 8H+YWXud1Pd6HQhbT4SSOQ59OQr6M6n7rRbikjvv632blP/8RGM70rCTdDkAkRz7JV7k
 oJ3LCt9MvQRCX3Ut75e0mjcdhtthxh1zH9G9yPxpFLLLtLPi+rkRWwqKnQmvV/fhXquy
 +mvPG8CnJL7MNS40XwnttmrXtPzkbUwiSwsP3IZtdFZ6ni2BfmvE42ABruSG65PYhbh6
 VgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=febfKlWJi5gGxYdmeWZw4Fi5Cx8ThIzR9wUIWuDizCE=;
 b=KHSyeyB+mBfzhFdMNmpWNQDMfEPd15XqUI7Db233ZtKlKXpSH1/SY5vcu72g0Fu4sJ
 6KvWth/j0TTBzuguQlkVkuqbtD6UizY8u0jpzJbyjWzEYmb1erLlAuAB/VZri02Ejz71
 sRDgIsPQ0/PLLCjB8Xa/KoIn1Uf8fE6u6Fi/vpiseWjj56Z5sEiLxzojaDpvP7oDtJOc
 FbpmQPB7Ylag5zUScbuUbCdKA1ag3AeIoApIN69E4oFGsjuhl5HahosRRwiKYoFBQS2p
 L8pLNpiC+ozs9b5Je+1CfG/Ab5WdtRGtZ3LmaWNfMCNC0Zwf368rlP9ddA2bohQYt2mo
 fmJg==
X-Gm-Message-State: APjAAAX75M2V3fW0AKJXlIu2wp3A+IZRQtAlOFdjGfaeTCW1xGOX7f3H
 6qGKYZBE4X/GgI/mVR3lnosV5Sac
X-Google-Smtp-Source: APXvYqwKi/pjpY+1q9oCaxglZOH6Jtmslpke/PA4yi6SHCxe0djIH9S8SnYfqxtXvP4AihM0ZUNDpg==
X-Received: by 2002:a17:90a:9741:: with SMTP id
 i1mr35005987pjw.41.1573481768634; 
 Mon, 11 Nov 2019 06:16:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u8sm3700134pga.47.2019.11.11.06.16.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Nov 2019 06:16:07 -0800 (PST)
Subject: Re: [PATCH -next] fsi: aspeed: Use devm_kfree in
 aspeed_master_release()
To: YueHaibing <yuehaibing@huawei.com>, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrew@aj.id.au
References: <20191109033209.45244-1-yuehaibing@huawei.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <62eacd00-300c-bc3e-b680-605bd0b7a983@roeck-us.net>
Date: Mon, 11 Nov 2019 06:16:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191109033209.45244-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-arm-kernel@lists.infradead.org, alistair@popple.id.au,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 11/8/19 7:32 PM, YueHaibing wrote:
> 'aspeed' is allocted by devm_kfree(), it should not be
> freed bt kfree().
> 
> Fixes: 1edac1269c02 ("fsi: Add ast2600 master driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/fsi/fsi-master-aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index 3dd82dd..0f63eec 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -361,7 +361,7 @@ static void aspeed_master_release(struct device *dev)
>   	struct fsi_master_aspeed *aspeed =
>   		to_fsi_master_aspeed(dev_to_fsi_master(dev));
>   
> -	kfree(aspeed);
> +	devm_kfree(dev, aspeed);
>   }
>   
>   /* mmode encoders */
> 
The memory is attached to the device, and will thus be freed once the device
is released. Why is the release function needed in the first place ?

Guenter
