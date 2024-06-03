Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC968D7D70
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jun 2024 10:35:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CbKH6rJP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt6VX63dSz3cRK
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jun 2024 18:35:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CbKH6rJP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt6VQ2byHz2xQ7
	for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jun 2024 18:35:08 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4210aa0154eso26395675e9.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 03 Jun 2024 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717403703; x=1718008503; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWLTR6JC6K40ewGX4zHo61KjhEfsmZ8Gp4GTKS7lOrY=;
        b=CbKH6rJPxlZEj45QV0Qh2Nb2Nv2cwualzO+dd6VvW3ZwKyKMyj1F713VdrigBTN0Cj
         jRoeAwAXW4VIOik9dWJcStuOFHH2oYVqsvaf2I9luBZ2cCWneBXptfPUJencgvwdqWY7
         /kg0pQI/iuD2FWh4V13qSDj0LcPhCDgiGBreyNMw0IruzFF+TUpQfkgDp/VtGBcmo9xB
         Zww+UH6TzuSBRFAU+o/nJQBuvbuxDW7ZO/604J8SjdBJzvghvpw+G8pUXiE4NxiNBmvf
         fD9j843pG1xML3Nslv529wqcRUsLhB5wQCNP6CQQ/S+GWLmL5L5h8RS5nTq7PsGIzCf9
         BHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403703; x=1718008503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWLTR6JC6K40ewGX4zHo61KjhEfsmZ8Gp4GTKS7lOrY=;
        b=L0Y8EnMcviVlTGkUIg4q/qOTmh7hEW4af6kHvvumMtNAa5aAb2RX7hFRnTl9Fb0OTb
         2odkBw5P0T66s3NqvTiod0s75shpq786utAmJ7g0CsFn84CRDhXTC7GbZfJ3aeWTrurg
         Ho2+P8M/eKTHEYja3+mM94lgSk0AJPAQm7gkJPsYCS4E1RuWJq7N10v8Km2gVZNhNrsc
         8b6hsf+4AE7xnkL0UYjrH44AZl4JFQdJ+AQUdToMl5TaYvU/1tzQ7jXeCcR+StALHi05
         bMVZooDT8m4bgZMgCT5L6EgQKw0G+opEd+aXiR0kKAEy8fSraOc2EJwCy1E+mLnVuqrs
         Xqyw==
X-Forwarded-Encrypted: i=1; AJvYcCXyvYTzYfbl5EYjagjrZm2iFknQGBCLs9K3Jbx3uwH6+RYBbRS820zBeIDYSs6pnROIpHq3Fqp8jcQLZAPLhgq6M3RxdkUn1kZGPyN4Tg==
X-Gm-Message-State: AOJu0Yyt3ynH/KyLG68L334RyXyVoxUHstFNsjR059Z3K6oce8VAzNFk
	YaHmmYYyDSc4p9JA4ueu9sILJz8BfftQSUT1lqW75r3Co4HoCQkhs9KdPsFaCYg=
X-Google-Smtp-Source: AGHT+IFN4XPjK4usqCfza9VDTkzx60Ym4DVYamJhOx5J6qxkiUTASW38jzri03Yq5NtKjPRPofRpvw==
X-Received: by 2002:a05:600c:1907:b0:421:20d:e3a4 with SMTP id 5b1f17b1804b1-4212e061c60mr81864775e9.17.1717403703250;
        Mon, 03 Jun 2024 01:35:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5b1:48e9:27a3:7085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04ca981sm8051707f8f.33.2024.06.03.01.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 01:35:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2 0/2] dt-bindings: gpio: aspeed,sgpio: Miscellaneous cleanups
Date: Mon,  3 Jun 2024 10:35:01 +0200
Message-ID: <171740369951.11706.10620844731089866743.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 30 May 2024 11:09:47 +0930, Andrew Jeffery wrote:
> This short series fixes some SGPIO-related devicetree warnings currently
> emitted by `make dtbs_check` for Aspeed devicetrees.
> 
> Please review!
> 
> Andrew
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      commit: a31517b11bd188527b2f8a4b8fd3e91a10f44d04
[2/2] dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells
      commit: 3a40985960bcab918da23f8945ab0cd3be12d716

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
