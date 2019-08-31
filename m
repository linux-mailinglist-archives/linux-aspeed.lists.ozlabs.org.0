Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C184A44D3
	for <lists+linux-aspeed@lfdr.de>; Sat, 31 Aug 2019 16:53:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LK8h3N9ZzDqxX
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Sep 2019 00:53:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kC6LfR9k"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LK8b38StzDqF3
 for <linux-aspeed@lists.ozlabs.org>; Sun,  1 Sep 2019 00:53:00 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id q10so1363900pfl.0
 for <linux-aspeed@lists.ozlabs.org>; Sat, 31 Aug 2019 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9BDuDRjmF116OgtDaHNeOzO00s8uzxNdezpyBuRSAeQ=;
 b=kC6LfR9kBk1TZjb1CVjCLOPJJm+I4pY1IDqTkD2ktfZ9E6LJl3xMN5KYJdrLrjVZDH
 Zx6eEptthNTXQtoISm9+zgEkF/uDSn/GP8LXPZAfLjVtSvRiRPpEeIAaEtUqiy64UQ7J
 T7ortflVdD9g1ZRmTwvR1TDWIUokzUPmvrQ/8RbRGwG+vM82HogHrtycaXCYMMGusGjD
 M3Iy3Z79Q4ugJbkD1tmXDBFj2+D4woKp7DjCAR7ReyePDNQJGpzTzQ21vVB99wT76sau
 ebX5VH80r39qQGEXKM3i8SSudG+p42fpvLyvyZC5xO38X+ZfjDAiK2pSn6zQFydkWthv
 r1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9BDuDRjmF116OgtDaHNeOzO00s8uzxNdezpyBuRSAeQ=;
 b=jj17snx0AV2Kn+tj6yG3vR59qjyLokOG4tdpmpAM5Letux1g5MipZzYVLpBMFbKdgy
 0zLESb3bHwep9PxjW4DFdcdCWbFBxtA0VLt57R2Y74rXQ2FR0GXzZedHYVZAkGBM9Z7N
 WgxTELlr68HoWCs0lgQEYQyXfHycEistSLet+iDuIiUZyiuaKR+hmMcpDp8BM9FmaW9c
 IPFTK2bp2PQIb+jHSlaFqk55AVgLwX27mXUWUGk4fHg8rXDcEW2WCbVoIxDV1FWdkuoa
 yL2MFLamJqjovuP4HVHlMFtbD7H19zdqFlWH/lh+slWrOzL5JjcjSXU2EW/TId1lyvJX
 aPtg==
X-Gm-Message-State: APjAAAVEHERlBa5F9UtxoKrYLazFTWajoqrtESgT35whCOWaupkO2WEf
 UtmSuFsnRJzWmkTwYQccIME=
X-Google-Smtp-Source: APXvYqz8+XI6fkaN065GcPbaUGwdNg8Rs/XLz0t7x/vxuFhL+XJ63s6WVe7ccozksx2DwOh7IAdxKQ==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr17260595pgr.156.1567263175393; 
 Sat, 31 Aug 2019 07:52:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e21sm10121157pfi.13.2019.08.31.07.52.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Aug 2019 07:52:54 -0700 (PDT)
Date: Sat, 31 Aug 2019 07:52:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Message-ID: <20190831145252.GA6062@roeck-us.net>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-2-joel@jms.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 02:47:37PM +0930, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - Add Andrew's r-b
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..d78d4a8fb868 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>   - compatible: must be one of:
>  	- "aspeed,ast2400-wdt"
>  	- "aspeed,ast2500-wdt"
> +	- "aspeed,ast2600-wdt"
>  
>   - reg: physical base address of the controller and length of memory mapped
>     region
