Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B108E602D2D
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 15:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsFNL3ns6z3c5v
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Oct 2022 00:40:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z8Yp8a8z;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z8Yp8a8z;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsFND5mSBz3bkQ
	for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Oct 2022 00:39:55 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id o22so8597660qkl.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Oct 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+sLgrbsGMQHlemgqQ7Mq0DFwn5lvuXfVQkqzsmbPPc=;
        b=Z8Yp8a8zbodfJ+0cy6HZrLXd7Wj9v77Qx8shoJarMrcirS/pY3TTcl+uzS+HqtjkVK
         6SIJFTRTymA+j74uqIA+VCx6ufHwulAgozSQG9U+Loubt4n1kDhJFQt9hPsHOCqppjnI
         BZo0TLOvoXy+Rjc9q9oGEhDrUq/JOwd8a8CO7BkdE/45WKP1AdyKKUa9K/Cin/t7SqRn
         sid/jFqbBqHfaoofCViIqQ1SvdLmH/7tBfaKaq/aoBc2vzff96n/HAUPEZtpJIMK6tRA
         EpjG3sFT+ApgAbBrgwLmdFX8Q8T2+apOr89qgQDt8c6GaJw1AOpiNi0Jb58cSr2w/MQT
         nC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+sLgrbsGMQHlemgqQ7Mq0DFwn5lvuXfVQkqzsmbPPc=;
        b=BUo9KQo3E+D3WK5Piom6XrGChKDmCFJrA8EYmiIiUKcaVPL00bodCGPpUmp/hUsaxD
         aVDq4XS0x7eCF5r79uItvsf/EEwm5UGzk+nnJKTBb5DnwC5uLMBnRK11YFsVABotI0MW
         mgdcVAHa/LeaYYJwubN6WxJ3rViKo0iZysJX0MBh4xLfZa91gS4RSQGWlzOv/dMwhaN2
         ASrNvkBkzGwFG7/EAR8x9XTzvuNR1bWOKaU2HM8cxv8Ic/cdxJi13IUi8+/TFnW9usSr
         78wT0AQ3P+a5yzEP0swszTA0M3LpFhKawldFPGBef6lizde1qVxVRTJSr+KTM0/OyXxl
         5Gyg==
X-Gm-Message-State: ACrzQf05Q0dQT22d5MlIWIyZikHoYX0j1kldZU/RrNaIytgkcWMPyRYE
	i/WdLaP7Sh70TIon3AtGyyQ/wg==
X-Google-Smtp-Source: AMsMyM77QVLHqie0IxFfekeRYS2BibCfcZ0ghwPBj4VV4wG0myvynk87fYbUHdKPYmPTDjePFO+BGw==
X-Received: by 2002:a05:620a:40a:b0:6ed:2700:e080 with SMTP id 10-20020a05620a040a00b006ed2700e080mr1767424qkp.649.1666100391578;
        Tue, 18 Oct 2022 06:39:51 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id t24-20020a37ea18000000b006c73c3d288esm2368713qkj.131.2022.10.18.06.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:39:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] ARM: dts: aspeed: align SPI node name with dtschema
Date: Tue, 18 Oct 2022 09:39:46 -0400
Message-Id: <166610038083.12522.14381298437428190883.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830180344.15657-1-krzysztof.kozlowski@linaro.org>
References: <20220830180344.15657-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 30 Aug 2022 21:03:44 +0300, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern.
> 
> 

Applied, thanks!

[1/1] ARM: dts: aspeed: align SPI node name with dtschema
      https://git.kernel.org/krzk/linux-dt/c/50c7e281f44726249b5ab7f148c02bbba751fea1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
