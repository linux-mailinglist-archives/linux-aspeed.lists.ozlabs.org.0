Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D09579B7
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqKQ593wz3g7t
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:57:46 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=B9RtISlZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wmq06SSz3cGb
	for <linux-aspeed@lists.ozlabs.org>; Sat, 22 Jun 2024 08:12:09 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5bfb24e338bso998854eaf.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2024 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719007922; x=1719612722; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmzSXNP21R075UYu7ymlgDX9W/Dms83ZZmrfejrgjMM=;
        b=B9RtISlZ7VptVTuPeWNY6gDzCcTT4puL7g3krJgNJK8YPhmhE8tsc1GWkk/poozlNx
         8hdwLKUpDYPBLGWJGSwZHBuIKL1mqB9T0EeFS2Tjdt/W99NpYkISFj54CByaJjJf7S5D
         EYJ+BDPOdu/JprBYsArPKQAk7nfLnJiMal0cXxJn3Q/brpbYfIOqmWjwj+RBeAQLTgxD
         EpaDOzsIKnv3JbIdisin3HzI/OoBT2cT52x+RTy4fEHCivSMJEoIDTiLm1qi4xaO2aui
         ZhtBMjW9uLyzAujQ/Ob90WOQDGkTNBub8RragWIZlagHOR0oJ/OEAFHXtCbMhMKCCZTV
         Bu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007922; x=1719612722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmzSXNP21R075UYu7ymlgDX9W/Dms83ZZmrfejrgjMM=;
        b=LD4g0Ub6F5hxhMMd5LEke82/PQiqotR8tg+gSW28GCUMa96WsPL8sxDto0a9PD94yB
         7NTtNjS0q3fMe8xHIfOOreDj5W32tI88sftsQ0sTE03ZZev6njNMJA31o3OueX00qrxQ
         pOIV/CE8QDAnhlF6gzVKXUZ62NazYjt8o/n+X3Jhd+CpRlImIcwNvPjcQwgp+JeC9S8/
         GzwZ8bL94Ugvq7YgVhZ8rfceEqMrf3WSyjiRwiBi4R1shcU/xcwgMpG6NAeSAVDHYYic
         8SPhxmjSUXPcHVBjSSZcBOKJGL+s/aoaGG07ybKDCi2QkTmbj14Y7IM/SYocjCqYQ25E
         ShAw==
X-Forwarded-Encrypted: i=1; AJvYcCVRrNZUfa1C+2JcR3V//xc6rZJRq+AxkhroiwHzVYexlmJtLwBpw3f6iN7fxSdM52l1BY+muzjWodbpKbws3TJ0ipCbwLlloUoX44dq6A==
X-Gm-Message-State: AOJu0YzvC31HkgFA3fpSPqBwbBfy9CipPPt8RFUwKON8av4UKXFUhqoN
	t3+MQCVZk+Q905OzyYffnpg6rvzRzPakW5Kq/qxlOUXj8UxXXQl0/oLaRy6RTf8=
X-Google-Smtp-Source: AGHT+IGwLaxf3WWNTpwyB7Womx7K1+1kbrWpsLo0q6oK9vgQPFQAtCkWtcmH1xRg/3vOcNKhpv9pRA==
X-Received: by 2002:a4a:a584:0:b0:5ba:d785:cfe5 with SMTP id 006d021491bc7-5c1e2690485mr557577eaf.2.1719007922520;
        Fri, 21 Jun 2024 15:12:02 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d94fb2a4sm329837eaf.10.2024.06.21.15.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:12:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 00/10] iio: use devm_regulator_get_enable_read_voltage round 2
Date: Fri, 21 Jun 2024 17:11:47 -0500
Message-ID: <20240621-iio-regulator-refactor-round-2-v1-0-49e50cd0b99a@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: David Lechner <dlechner@baylibre.com>, linux-aspeed@lists.ozlabs.org, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org, Andreas Klinger <ak@it-klinger.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is the second round of patches making use of the new helper
devm_regulator_get_enable_read_voltage() to simplify drivers.

All of the changes in this round should be fairly straight forward.
And as a bonus, there are a few patches to get rid of driver .remove
callbacks.

---
David Lechner (10):
      iio: adc: aspeed_adc: use devm_regulator_get_enable_read_voltage()
      iio: adc: hx711: use devm_regulator_get_enable_read_voltage()
      iio: adc: hx711: remove hx711_remove()
      iio: adc: hx711: use dev_err_probe()
      iio: adc: ltc2309: use devm_regulator_get_enable_read_voltage()
      iio: adc: max1363: use devm_regulator_get_enable_read_voltage()
      iio: adc: ti-adc108s102: use devm_regulator_get_enable_read_voltage()
      iio: adc: ti-ads8688: use devm_regulator_get_enable_read_voltage()
      iio: adc: ti-ads8688: drop ads8688_remove()
      iio: dac: ad3552r: use devm_regulator_get_enable_read_voltage()

 drivers/iio/adc/aspeed_adc.c    | 30 +++++-----------
 drivers/iio/adc/hx711.c         | 78 ++++++++++-------------------------------
 drivers/iio/adc/ltc2309.c       | 43 ++++-------------------
 drivers/iio/adc/max1363.c       | 28 +++------------
 drivers/iio/adc/ti-adc108s102.c | 28 ++-------------
 drivers/iio/adc/ti-ads8688.c    | 59 ++++++-------------------------
 drivers/iio/dac/ad3552r.c       | 28 +++------------
 7 files changed, 53 insertions(+), 241 deletions(-)
---
base-commit: 7db8a847f98caae68c70bdab9ba92d1af38e5656
change-id: 20240621-iio-regulator-refactor-round-2-28a1e129a42d
