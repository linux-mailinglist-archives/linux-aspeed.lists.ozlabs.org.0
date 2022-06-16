Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED6554EB85
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jun 2022 22:48:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPDlY3W58z3bnF
	for <lists+linux-aspeed@lfdr.de>; Fri, 17 Jun 2022 06:48:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pWd2gWMc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pWd2gWMc;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPDlP4XHSz3bkt
	for <linux-aspeed@lists.ozlabs.org>; Fri, 17 Jun 2022 06:47:59 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id k7so2189770plg.7
        for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jun 2022 13:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jnD99uencGMjTPpflykxZNYOUgUN3LUgOaJGkyuBq30=;
        b=pWd2gWMcVtb2dxWnVHPatHbAB2Xdpt96Ys9iB5jXphQh5KSnWbOKCf7wGVj3VIPjeL
         4gRZHPFC43xJmqWfyQHjLHWCncnzd5JqZ+Au/+PUJOh8jxcULCy/+l7wVIuK5r6KppnM
         yNwaGMX/YFZ8/+98md5wb9xZCHdN/v8z7ZSmjcCbQDzV+SQyE4BsrPVbzKT4G4pWxsGN
         2IrP1t5qdpac6hKOV/VtQ/S9l4yvVOTdMlDmPBRCoPnOuVOG1eWxMPgKMfRwfYYX6VOQ
         ZThqHRYkagUArmWKYbdvTb2tYuFUfzUjsBbFGIerC/l1G4wywVX5ew22gst8QM2wQ4mv
         CfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnD99uencGMjTPpflykxZNYOUgUN3LUgOaJGkyuBq30=;
        b=1m4IBvR44mM3wY/N3HDzNx5ghdGWjb0Q3JCnVaKhdLvbp0rrUtMEfmJyp72rjwtc3J
         8Hxqav3LtwF7ngmtmxbSefmYe3nAfTX2SudkAdgg0XYHco6308dkmY2Cav7LD57KzUTi
         Cq+JMHqbREXMSXN8J+0ZdIRsMDhblC/5hR4SlhBFtwpxpScCCtEtuP77RHGf9QnMjkWW
         JP8A46mRhSgzTWuB4jSA/Ds3ebL482qLHbZ5s7hKKM8XgLhLJS+PRhNorXhjEi+McDDC
         uurFTJev7VzCPd3DflMh9C6ip9pELPfI9ocW3195XWnT1Mestn5Pz6xev38jskXBhEdk
         4MuQ==
X-Gm-Message-State: AJIora9Kfcwvk3vHFOgiZtLg0+T4WSX+VdONMF5w6JDSjtX8Nzs0ByJ9
	SzZgL3eTqUStGJ8jIsUmx5R4wgCkYocyNg==
X-Google-Smtp-Source: AGRyM1srUf92ldxiVI8QIWyED6HakwtuZcKqfwr84IMozkgc4DIwT4ycq14eV6FtmSctJTFDsTwcog==
X-Received: by 2002:a17:902:ebcb:b0:168:e3ba:4b5a with SMTP id p11-20020a170902ebcb00b00168e3ba4b5amr6308144plg.11.1655412475720;
        Thu, 16 Jun 2022 13:47:55 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-aspeed@lists.ozlabs.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@aj.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:16 -0700
Message-Id: <165541242280.9040.12820468454884340112.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
References: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 26 May 2022 22:41:27 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: aspeed: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/94d0a03297615cad2d40b0f02ceab902a7339062

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
