Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 497058B02B1
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Apr 2024 08:58:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tD7snJCO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPVFn6QJ2z3cM7
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Apr 2024 16:58:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tD7snJCO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPVFg3Dg1z3btk
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Apr 2024 16:58:46 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-417e327773cso2798605e9.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Apr 2024 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713941923; x=1714546723; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O78Hh36TSUxQHiXT4IV/zwLJ0EgsWrgWuOVvzi0ewJ0=;
        b=tD7snJCO08MPZxYziN2CmH9s/rlqUJWP6uUkXWRktDpBZBBI76QZvOakArpulQYOAp
         +5xZReE7+0xyWm5UnLhX6gZ64Uxd/z7XQTSk16aTsvCzMmGNpFCXYtS10k263QOa5PsE
         VuB9uIQaqFtgFE2LuS+IzZ20Dh5gc2/duH0a/SqyF3a8oQ+V7cUFQ4qEusZipsUrKmOG
         OSr/3swsaY7+mYyr5h7wX+m50OUD7K6k77ke8/HKH3Som/BCBgjUufVOwOD6toqU8pb4
         WXBpQu/taj1LslHUfkW+6uAe1vjRvH4a0r4t0IT4GGqG1v7smglnezgSPJ9AeAaNHgNS
         Ewag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713941923; x=1714546723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O78Hh36TSUxQHiXT4IV/zwLJ0EgsWrgWuOVvzi0ewJ0=;
        b=lBhG7alBHh+KYYaFB3wSYf0ncMZH8PxaIZBSwB1xRgOmUmtQg39wh92qi/ZiNKzdQt
         Uzh470i+AxAlshyQOdy2GbvY63KxBijojIO+O+KZ3EYMThI22rdbwZmqZnq8krQ8ADYy
         z48izUjDcAZehpysOi4fvh5Nke2fNdWttIghktzfuFP1jHHqQpcWA56TceKX2pLZMfdz
         oJGlaUUnR7CQoe9+j/C5QETJs5WVupfDzaclAIbnJkIxDMCMoI2NjD9Vk8KiamK7Zj+o
         s+mGOSz4OzgYHhF6tDKaRvCjE0kzLmjvpJkrmFPSJGvH1/u4RgX0YYFdfsm0hE7SZttD
         x7/w==
X-Forwarded-Encrypted: i=1; AJvYcCW9A/bjS6cG95AXzPYtVAPrSVrsZxximlSSn2vYc/zf81HlQdAMjtkWnJ3J3j/Gou+Pqz8LtlVi4ctRCjvigE0fSptwXiYr2EknWlsj0w==
X-Gm-Message-State: AOJu0YwukzToDk6E/fpI6i4OfRFRSfQ30xmWp+dLu2BbLST2+kR1K9Ff
	5owz2PJjDRjAt4krvEvynT9YVTpYEZBOoceN+uep/S+b6n2gX99txQH6F61UV1Q=
X-Google-Smtp-Source: AGHT+IHdqdvmG1OCdSVbD8Yhju6eOHjIjw+T/ul3+A+rVxpO/yj3O7VyiNa0RLwyXKP6Wll0sbVX/Q==
X-Received: by 2002:a05:600c:46d5:b0:41a:56b7:eb37 with SMTP id q21-20020a05600c46d500b0041a56b7eb37mr811061wmo.20.1713941923197;
        Tue, 23 Apr 2024 23:58:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bi8-20020a05600c3d8800b0041afe0f2f17sm1175010wmb.16.2024.04.23.23.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 23:58:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings
Date: Wed, 24 Apr 2024 08:58:38 +0200
Message-ID: <171394189432.44668.6061047707500811188.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224103712.20864-2-zev@bewilderbeest.net>
References: <20240224103712.20864-2-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Sat, 24 Feb 2024 02:37:07 -0800, Zev Weiss wrote:
> Due to the way i2c driver matching works (falling back to the driver's
> id_table if of_match_table fails) this didn't actually cause any
> misbehavior, but let's add the vendor prefixes so things actually work
> the way they were intended to.
> 
> 

Two months passed, no replies from maintainers about picking it up. Dunno,
looks abandoned, so let me grab this. If anyone else wants to pick it up, let
me know.

Applied, thanks!

[1/1] ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings
      https://git.kernel.org/krzk/linux-dt/c/1afe35e54a89d762f1cf71da1ef29be2c387be35

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
