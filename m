Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75988E9BE
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 16:48:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8W69mP7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WKz4Kvyz3vh6
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 02:48:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8W69mP7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4WKB2WqTz3vnN
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 02:47:57 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e6f69e850bso20850b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711554476; x=1712159276; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eT6RRJ5wM6yBnnPFeWgam/sB5rIgvY6T44XG6PUPlYA=;
        b=W8W69mP7+vkHM2R5haL8u7fl3SsF35+bZNqanUL+w3mG6J2rQdbVHm0HBKKe94eSoN
         jf4C7k5AJkC5PmOVRg7u+sXmyDtZw+gNOfOj+88I71LycpEm05vBN5j3yFIlOOrnu/Zq
         2BuwjoRd9YiUWBE3toXSjquNlkrgp6aM+th7YiOs/TElsz/sSkUYWvhuiiUFZgmOue1g
         k2+0Y/w3pMfKYSdE2H5BBDOKsq/CQxQVfH7GKGhm3ZQTHVXo3L70CGqPKDzySFg2n6G6
         5iQngIXL6p7xUWWt8kLDwVWjQ7banlQ3b1QpZZW25nf43G08lxrojJDAyR0AfPPaxScO
         USTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711554476; x=1712159276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT6RRJ5wM6yBnnPFeWgam/sB5rIgvY6T44XG6PUPlYA=;
        b=Pf26wqfzBZo7TPWKsWco2Fg2VIiVr1X9hieSK0jO/VwhOR2wn74PAmsShrbWr8ZEoM
         6tFse+Ku0QANbTmnNXpr+bIQarHj21vpuwSzt2hHtCtLo7San9M55TYDaPDbVISju+Q9
         vRxT8fOdNTTH3AX1UgFGkN+8YYwbuzJdkRP0NW5138JGjMSenTL2h5RuJyBiDXTBQ9VN
         9Qk4Et+k/wdKPSn1UxxVdLzNUR4U6qmybsewKVq42MEz+yHbMy3zBo+srLpBLg0ZWKvP
         nY8zjYTItVi7DwBqohfoLXRD2/nAODIfB0G7Ten04dYTm3ZOYIaT6CcAk9QXu4P2nZt7
         u7WA==
X-Forwarded-Encrypted: i=1; AJvYcCWetCqG3M8dmOoHqWQtaRszQYu7gmJkKdUrS51ZqF0tWodOs/Ye/nKHSFEilHmszvXdVmyq9BWxAfnHeE6YNMLscUdzi1cBDH6K7RIbCg==
X-Gm-Message-State: AOJu0YzQn9SNx7zNS8NtDgGSCNaRx8RFBleYlf/5sN3jVz1K5cmRD/Rl
	+9hfQUJItc0Ju3KKjqDsd8gOe0odvIi8MW+UPnfSsxUJTOx3R74t
X-Google-Smtp-Source: AGHT+IF0Tz/1tZbon8ZyoPuVtBFegqTDyV303CbHZkFrvI4HsOOb4/sHuWZiGA3QE0H8xrr2jlhWTA==
X-Received: by 2002:a05:6a21:9210:b0:1a3:48c4:10b1 with SMTP id tl16-20020a056a21921000b001a348c410b1mr321165pzb.40.1711554475561;
        Wed, 27 Mar 2024 08:47:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902c40300b001def1ad9314sm9210138plk.245.2024.03.27.08.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 08:47:54 -0700 (PDT)
Message-ID: <f0b03c0b-eb54-420e-a4f7-8286e20b9df6@roeck-us.net>
Date: Wed, 27 Mar 2024 08:47:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drivers: watchdog: ast2500 and ast2600 support
 bootstatus
Content-Language: en-US
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
 <20240327085330.3281697-5-peteryin.openbmc@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240327085330.3281697-5-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 3/27/24 01:53, Peter Yin wrote:
> Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600
> 
> Regarding the AST2600 specification, the WDTn Timeout Status Register
> (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
> on ast2500 if the boot was from the second boot source.
> It does not indicate that the most recent reset was triggered by
> the watchdog. The code should just be changed to set WDIOF_CARDRESET
> if bit 0 of the status register is set.
> 
> Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
> ast2500 SCU3C when bit1 is set.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 60 +++++++++++++++++++++++++----------
>   1 file changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b4773a6aaf8c..29e9afdee619 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -11,10 +11,12 @@
>   #include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/kstrtox.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/watchdog.h>
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> @@ -65,23 +67,32 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define WDT_RELOAD_VALUE	0x04
>   #define WDT_RESTART		0x08
>   #define WDT_CTRL		0x0C
> -#define   WDT_CTRL_BOOT_SECONDARY	BIT(7)
> -#define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
> -#define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
> -#define   WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
> -#define   WDT_CTRL_1MHZ_CLK		BIT(4)
> -#define   WDT_CTRL_WDT_EXT		BIT(3)
> -#define   WDT_CTRL_WDT_INTR		BIT(2)
> -#define   WDT_CTRL_RESET_SYSTEM		BIT(1)
> -#define   WDT_CTRL_ENABLE		BIT(0)
> +#define WDT_CTRL_BOOT_SECONDARY	BIT(7)
> +#define WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
> +#define WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
> +#define WDT_CTRL_RESET_MODE_ARM_CPU	(0x10 << 5)
> +#define WDT_CTRL_1MHZ_CLK		BIT(4)
> +#define WDT_CTRL_WDT_EXT		BIT(3)
> +#define WDT_CTRL_WDT_INTR		BIT(2)
> +#define WDT_CTRL_RESET_SYSTEM		BIT(1)
> +#define WDT_CTRL_ENABLE		BIT(0)
>   #define WDT_TIMEOUT_STATUS	0x10
> -#define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
> -#define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_TIMEOUT_STATUS_IRQ		BIT(2)
> +#define WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_TIMEOUT_STATUS_EVENT		BIT(0)
>   #define WDT_CLEAR_TIMEOUT_STATUS	0x14
> -#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
> +#define WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>   #define WDT_RESET_MASK1		0x1c
>   #define WDT_RESET_MASK2		0x20
>   

The above bit value defines were indented to show what is
registers and what is register bit values. Why are you
changing that other than for personal preference ?

Guenter

