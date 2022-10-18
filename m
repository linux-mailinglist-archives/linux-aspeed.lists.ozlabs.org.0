Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFDA602D30
	for <lists+linux-aspeed@lfdr.de>; Tue, 18 Oct 2022 15:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsFNQ6M2Zz3bkQ
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Oct 2022 00:40:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tTSPX3c/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tTSPX3c/;
	dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsFND5qJxz3blt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Oct 2022 00:39:55 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id g11so9625078qts.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 18 Oct 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ItLv3MrqFjkUjgy6D960E6gyycJQXgxPRZWuas15FM=;
        b=tTSPX3c/2Nmk9ShKjuwCzhVqnKOI59gBJpa/06ZeOfsicSC+rf4JFeV20qFwNsjydK
         GceXru9FHsrzxm1denxxeXHg/aQLihq2j027YT4rkaGQoltRTOzC3zkjLSL7wCNJtR3y
         R9RIn+ikEtMC8u+Q7n2u+MVJ94QMo2MHI5itvcIldQAovUxE1W2xs/uT/pBRIwIk2fko
         4e9a6Uaz3FofjBFJvGOj8I42qjjb8rAHc9RO9Mj/iYFoHqxoARYWr4AEZ/d6iJw0KaGs
         JfkVG5moiDfHxQHxfR3XPjCMuits0JvzwgkccLIJQiK1DewiSkInTvWBzPiC4J5cIDje
         FYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ItLv3MrqFjkUjgy6D960E6gyycJQXgxPRZWuas15FM=;
        b=K1ghjAj+272D+QoQyWOILFE7ptUVYzW/i9xPRyTqKBuwq2k7XEMBjxjACd8f9DyzKr
         V22w2VQt6YfPM96cOCaXltPytMJGOKfPdM/28bb1ZROF24WrO/GfINkbo+Qsg4pPYOXg
         1AY8RGfPY6jTbfzwgiPicEFz3h0iELA2Ch6UYC9n106ae5oUM3Go+Si1BOY47JMJHpkl
         BZz8cZIfuxFm+vXcbD6Kj2gEfv95Px1tR3AAPSP5FVbrH74FzsPZc/D7Heex1lMo08FG
         hr+eW8uukqs/SQs2qnTT1IpjXcY8LqH2sNY8xnswkAieUpBuIp1MRgcQw9v9kkzfOLFv
         3blg==
X-Gm-Message-State: ACrzQf1OG9xzvUWfiutk0iFhtjR/dF/NvfckhIyJiwD/xLRUM4Mzj2X0
	i6rv2HeGtkBYY/DpgTQw+iw5CA==
X-Google-Smtp-Source: AMsMyM5WX5G1+bv+TTjJ8KAiYFJyFCJ7K1wLBkHNS5+MrEGAk9iZiPB+umJcqXwMOHI/1sVsaTt0bg==
X-Received: by 2002:a05:622a:147:b0:39c:dc0d:7d0f with SMTP id v7-20020a05622a014700b0039cdc0d7d0fmr2026339qtw.281.1666100390342;
        Tue, 18 Oct 2022 06:39:50 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id t24-20020a37ea18000000b006c73c3d288esm2368713qkj.131.2022.10.18.06.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Rob Herring <robh+dt@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename
Date: Tue, 18 Oct 2022 09:39:45 -0400
Message-Id: <166610038083.12522.4054828286732887763.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
References: <20220811062953.5976-1-krzysztof.kozlowski@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 11 Aug 2022 09:29:53 +0300, Krzysztof Kozlowski wrote:
> The Nuvia DC-SCM BMC board compatible was renamed in commit
> 7f058112873e ("ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom"),
> so adjust the bindings as well.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: aspeed: adjust qcom,dc-scm-v1-bmc compatible after rename
      https://git.kernel.org/krzk/linux-dt/c/c74eb454dbf482b29d53e7bcc2af74a53b516fa3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
