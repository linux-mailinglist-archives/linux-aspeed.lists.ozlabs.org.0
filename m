Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B3C698E9E
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 09:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHSfH42Tmz3cfX
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 19:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZTxnV/pt;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZTxnV/pt;
	dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHSfB1RLbz3bjl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 19:24:15 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id t16so1633277edd.10
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 00:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3luqpqMCqAArv+ATLddgvJho7XZ+hO7X+w3N9TqYySA=;
        b=ZTxnV/pt75FixULSRW+glSd/hEjCXD8kSVS1r8oK9IOroR7sEG8JT29KIQj6OuayTg
         82J9W6gT48Lvgr6AcrWkoyiTpKMuj4o4/UdxGuUiJYGdaxYeWV9T/BOUek5StlA8gCnx
         +506CByaxqr2qgUUmIYMd6JqI1TtLJwWmCo6E4QOJvlnhPCuaRtZ88PHpIA9+MP3dxt+
         haxe9mhuH5Il+VJnO3nDaXdbplYlFej6e5+KcqoBoFzATDSlqUG2I4bPwkJsvzkGq3hy
         Mjwnz0aw/Nn71zBBBxYBF0qUOA7vVy1oOoUcDGgG73EPIZEhJ8XiDK5pfrgZaITZmAoh
         o2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3luqpqMCqAArv+ATLddgvJho7XZ+hO7X+w3N9TqYySA=;
        b=QNGtnnz5wb+STyhknDoT0fQElgxmBl2r12Yav6R8ysZ2SnrGVS8R7X9+dnkGHb6zP/
         X234EhJbG8cYJaMJWV3uumGAGVnVcP/LC6ieMIPYbm4fFvrpNhSbhJPlcjWX+sK/EDIW
         jk57FKrGL4gS5tOXzX5PLN6U2+47g+u/JecpR2GPIQi/jNInh/LHYDRy15siqgJk5Tt+
         bT4Z2qVHFRjrQNbOLhCy1+HizkmMbkUljVO1yq9p2LIvYpVfGxAi7r9waYSj4CmP13J9
         mbw23RFWdKQxsxEMFqtPLMMLnUZ5EYCYF+TgJkM1h10XqaG4TnVs7KxuHf0WlcaxBdKI
         Zsng==
X-Gm-Message-State: AO0yUKXXJIU2XJ6dL0OhnsFV+athi8ZjtoYoNaqjigNeC8Yh+f13T70U
	EzJsmCSX6/YIpufCtv4MJT3hwg==
X-Google-Smtp-Source: AK7set8ht+d14A7kUkpoXY1VjY6KH78thAEOM9Wve8zpWCCCgGBjK9Fie6hCWP6IGMCq8uOAAoLarw==
X-Received: by 2002:a05:6402:885:b0:4ac:b97f:214c with SMTP id e5-20020a056402088500b004acb97f214cmr4664837edy.2.1676535851432;
        Thu, 16 Feb 2023 00:24:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a50aa82000000b004ab4c28a967sm476133edc.44.2023.02.16.00.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:24:11 -0800 (PST)
Message-ID: <03fe68be-ca9f-967c-b5ef-0599177caf90@linaro.org>
Date: Thu, 16 Feb 2023 09:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] dt-bindings: i3c: Add AST2600 i3c controller
Content-Language: en-US
To: Jeremy Kerr <jk@codeconstruct.com.au>, linux-i3c@lists.infradead.org
References: <cover.1676532146.git.jk@codeconstruct.com.au>
 <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <82d750f53df622d8986e9a07053c7ee27dee61a2.1676532146.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 16/02/2023 08:41, Jeremy Kerr wrote:
> Add a devicetree binding for the ast2600 i3c controller hardware. This
> is heavily based on the designware i3c core, plus a reset facility
> and two platform-specific properties:
> 
>  - sda-pullup-ohms: to specify the value of the configurable pullup
>    resistors on the SDA line
> 
>  - aspeed,global-regs: to reference the (ast2600-specific) i3c global
>    register block, and the device index to use within it.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

