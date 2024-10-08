Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A39950EF
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2024 16:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNHmC5kRKz3bcP
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Oct 2024 01:03:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728396186;
	cv=none; b=AR+uFHgg4WE2mjj1BtVuLQgiwB72cwkg3WA7iUDjsYYTRVlpv6/C2K3ekh5Z+HCYOLb0f43YCKaJaBc1TGqJ38FQGR7tDRqrfdezD+09Kilfe3b7S6804/4HFCNBA8FEkF43Ss0g1N7jknV4YmXWPR3wrGhYPkgv1QDNq5BRT0yhoSCnA/KReGK8QdhCMgyY9A4XHL05GrMaJS0lccXvQj5fxrixRID4wxYusArqHWI9qdrmAC+tuidkx5prs9BcqwsXa6vV9OC9D5/jujBmZ2JwL8cQjhRq2apmdgeln2L6MWukOJ5Ux5d/eilxnMxX8qPAvlzGBqRhno19Uqn5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728396186; c=relaxed/relaxed;
	bh=wrB8SyBEggX7gkCJYrDAfUW+IVD/j7Ve4yJ4nlFfibo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XgAcFS9VDP3i1f0Ouec3NuQ5/Z5dxtdWsoDgWTODsfyzZE4N2uKb/oyxOP7nsaPBQ/GVjPk77Q0R2EKxGkLXODs3z0BLnCvojn25ecJ6oxeagOXFEiQ4T+LmepaELwu6AFC7BXQ5r9ArXfnHJTNIl1d31L69CS3nkug8ESVvdxyU7PGeBpwRvGPhm8z0qPf0PzJR7tJlxCQh21okFKL+cJ7Wndx29SgtDt7X+8L3WKJUkxwNL1mVDIrKuYamqjlX+OmFD4Hg3rlVTDfdJkrqKCqZOvKBo9K7PvKkZEGG0unGzgtgtRDOXBv+lycEpMHIZGHJB779g+6qKMpE3wadUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GE11qg9T; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=GE11qg9T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNHm864r6z2yvy
	for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Oct 2024 01:03:03 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43055b43604so4890625e9.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2024 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728396176; x=1729000976; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrB8SyBEggX7gkCJYrDAfUW+IVD/j7Ve4yJ4nlFfibo=;
        b=GE11qg9TRzoMHM1R08xEAT0Wo/VIcAtD6LeDAHlf5Of1Qy8qMvCSGua1zY+ACPi18c
         OazxcezvYfhBaYk/93eXhGnTmFMdqYJGaV4gs7lOYOiA4EEW5tdD3yTUkYiHQzXGSdi5
         AHT0EtsgGe+azViQf7hBsn4vleeKOlur++a9OOO9H70FV7vMI2M3BS9a3lXFAgO1oFzS
         uRImAfdJA/2S2WLWQq9/hHmKcrpYRkJuk4r+MjSCgMddUXv5DZB5/29tJR3cOTwUHY2W
         ThSVbCJWY9rCC2JmBxbxdwUXpVgjjNNIIVEw4X2lLQED7JUGduyDrXPZr/r0wWt+S+tD
         YRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396176; x=1729000976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrB8SyBEggX7gkCJYrDAfUW+IVD/j7Ve4yJ4nlFfibo=;
        b=od8UR210NNu1dgIQ5hy4NPhOj0wonLjGW8GtWO+9MVLDftinXOAwQmYEVb97uCgnek
         0xGW+iwc/RrRkiEeqYP4/9k2ABq0AyiiLJWAlybIhHB+60tXYGfS23+YSnK9Wdh9vHLi
         tjdbjbLtTXZd7kwh5pH4KROneQ85zZlmtzq60qClXnWNf0TuKzuHewlW6rnUHKV2B/Ca
         WGP9MwTahv/B94QLMhCSmf+NYXcs5OTaL0rlvwWj4zh31YVfC6ReoR7sL8IMSFU/jmHS
         yRZUW6KzJUjzKr7e8eYhatDWcCICfjIw4Rp3aGJzARuwHklHy2AdbDvL5zmmA2vDLTlA
         1VcA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Wroya8LH5oYJycOGd9ydT1BbmxGpprsOCwT8yx6j1hJwmfunAO5LNE/O6deIwkF3+xrsC17egvo/SzM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yww5h5KiqbQVinc85jzJ853tPSy181bFYdovJO8AuIpquyt3KPC
	J7m3a+cj4NzqgG1J6dt02DGGBv71tDUmZAWCeUI9M3VvZBsqlxuDNQT/6IXEUwo=
X-Google-Smtp-Source: AGHT+IEV/6cDSkCaLspx7rOPlHS533C+1XbFqrGunzht3iptdfLNh8w9eozrda6COlsrBspViWACGg==
X-Received: by 2002:a05:600c:1d0e:b0:42c:b995:2100 with SMTP id 5b1f17b1804b1-42f85a6d722mr101173635e9.6.1728396175387;
        Tue, 08 Oct 2024 07:02:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:738a:20da:f541:94ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16920be2sm8205953f8f.60.2024.10.08.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 07:02:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com,
	Peter.Yin@quantatw.com,
	Jay_Zhang@wiwynn.com,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: (subset) [PATCH v7 0/7] Add Aspeed G7 gpio support
Date: Tue,  8 Oct 2024 16:02:52 +0200
Message-ID: <172839616610.55104.2573120540182552334.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 16:14:43 +0800, Billy Tsai wrote:
> The Aspeed 7th generation SoC features two GPIO controllers: one with 12
> GPIO pins and another with 216 GPIO pins. The main difference from the
> previous generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, direction, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for GPIO registers and the coprocessor request/release in
> gpio-aspeed.c making it easier to extend the driver to support different
> hardware register layouts.
> 
> [...]

Applied, thanks!

[1/7] gpio: aspeed: Add the flush write to ensure the write complete.
      commit: 1bb5a99e1f3fd27accb804aa0443a789161f843c
[2/7] gpio: aspeed: Use devm_clk api to manage clock source
      commit: a6191a3d18119184237f4ee600039081ad992320

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
