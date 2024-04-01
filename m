Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0B893BA9
	for <lists+linux-aspeed@lfdr.de>; Mon,  1 Apr 2024 15:56:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dxp575dQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Xcb4Dkzz3dS8
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Apr 2024 00:56:47 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dxp575dQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7XcV4lBDz3bmN
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Apr 2024 00:56:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A585ECE000E;
	Mon,  1 Apr 2024 13:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E18C43390;
	Mon,  1 Apr 2024 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711979799;
	bh=SB286+nY7DQGLoaBo1jo/XJvyvYzcBgrwXpwBgupmWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxp575dQiKZXAdercVf8cUDwWfKwEI6IqLjDU0pN3iKC0OrWxwjzbb0sw0uNSB2su
	 DPVp94ewBebNT2v7SyvuYfXsqUtZpuUvIwWT6EtFTNIZpVf/zF7D0puWN82DDXTa6Q
	 Kpubtuqo9ATNQorO7++V53Rx8U58e13DUolQFy9a7g0XztCd9yAtBGZ70qTnVn534V
	 mzlsyll3/cmjN5WycpuflvPpxhB+kKCL1N70VmsHaxLPjc6UjtiLJo3Cr1rEybUnEb
	 i3tJWsVtJV6N59bCi3vYfRUQQWBcdPctEdOXf4zm4Aqec43LuDYbhXz0mgM8gHMD3z
	 3jWM2YyadVUzQ==
Date: Mon, 1 Apr 2024 08:56:37 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v6 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
Message-ID: <20240401135637.GA342928-robh@kernel.org>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
 <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024 at 10:22:30AM +0800, Peter Yin wrote:
> To use the SCU register to obtain reset flags for supporting
> bootstatus.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index 3208adb3e52e..80a1f58b5a2e 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,6 +8,8 @@ Required properties:
>  
>   - reg: physical base address of the controller and length of memory mapped
>     region
> + - aspeed,scu: a reference to the System Control Unit node of the Aspeed
> +   SOC.

You cannot add new required properties as that is an ABI break.

If there's only 1 SCU instance, you can just fetch its node by 
compatible with no DT change.

What's the plan for converting this binding to schema? This is the 2nd 
new property in 6 months.

Rob
