Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53C899C0A6
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 09:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRpBV5S8Qz3bqC
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Oct 2024 18:04:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728889472;
	cv=none; b=HjOECD/JqyBVGVZfK9DdM3auxiX/t4556kg8exdrC44gsiyndNBcH187pZ5WTOrPtFpNebFprLdURqjdai6m7ilGSavHhl14DTNBvaSNrfwau6e/aFBALD9OD5JULUO/DdWt6U2Txg1NmiUN251gN29GOlwVzSpcnb4gD5ufLtf3QXqXTJ9YnSwP8oSnnA9fHrJ1bZvPPOyssqqFDuQkSOOY2n8CtEmLtCOHWJUTsscSP3BRG72NbGaB4n0U690VXeivcTRibiyQxoKaq35Y8HcpBwxPs4mgJ5X/dtlt13HmaSnP7ChEg0LjwSN0rPLxAo823Rw82JSIkRjY3yBiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728889472; c=relaxed/relaxed;
	bh=FZPk1p46Il+cHBCE9t0JeMt9zPjBTrGoxmAeiUZmgWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpIGC+2On4bUVoj95ndfDgz7VwjR7aK3Wdx7/+iHvS0KUwWgEcFLR6gjxVNzxKOacsRNhgzS8AE6WDYJhnbHpKFRqb9P25boRjBj8QRZupDsGjdKfJuXR2251btpMol5yw8QHiDxRBv93TbCWL06jqDPs5fbp+W7QkFof8wGXZJWhXErDUzAAwAdlURiDDu9boolk1UsNXoD100aBsmA2B4o8flkZ2yfutmTbxvDFKnO0itPL9Y6rGCW+Rq1TPFdT0HiRophKIWStbELxsIYe+URXVGTsTAYf5SSkqVrEb9DT8oDKkzeZBoifYqnkCwetcSlUPBv3H8ZTfqRsT23mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X0EKIIb4; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X0EKIIb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRpBQ3Jcwz2y1W
	for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Oct 2024 18:04:29 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4305724c12eso29383145e9.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Oct 2024 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728889466; x=1729494266; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZPk1p46Il+cHBCE9t0JeMt9zPjBTrGoxmAeiUZmgWE=;
        b=X0EKIIb47+j0clD2JHKfJwzUZSWhucfbU5p0J0t/4+b9tWFv+80Wt8C+FYpWVdKU2x
         gNLAAwVL/exyE6/VpRG2aGCK4/gQyNcdoSVFW6axuQWMJzN5p0q+xYwmr8/obrXFkftu
         d4+pUuc+gu//II5LDgj6W2kW8ukP+V7AbrkGp9pGPbgkdFVF9kaggahStKrHz1CzNLN7
         +YwcbdpxksBJMVaDyveF/Co1sq23Bl/kdIrrc7pz9Arm0IKIQ3QLZ2to+Gofy9tRR7UJ
         wQyi5Yn1gy6nTLGcp1jwScU4Qw7X/qkmoDyEmAYCsNwj83HVlXXGsbjOO1itQcX5pGKU
         Hv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889466; x=1729494266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZPk1p46Il+cHBCE9t0JeMt9zPjBTrGoxmAeiUZmgWE=;
        b=ehjRSk2eOOVu1FbxwdD+AmBlsBSQbLaTVVT1VowRtaJKN4UkHNCV1QMrzmDHRmUmhF
         ISQBOJosgjr8mlSL3GKWNxUeyAIdPo5CRZ94i0piB5eltbu+wyX7G08ZlNoZnMyCc2mC
         J7CJB8e3rt4XEfatnvi6qeQfy/0/2hUfyvQ3vbuvO/LTVaH6SdTl2dEGQw7fovD8wvON
         2VGr+9ZILBtFUh5ff1ju0n/ghG1o4/ZjcUtMQTPgAQ0kppCEdeVYWCh/RDEkKZEHA+f2
         /zd0fAXT398c+Gh+Dg8zUI0jF5l5oUgQgtLskiDTZkJ47Xx9AFp1rZJnL8wg7QdJgOQe
         SHGg==
X-Forwarded-Encrypted: i=1; AJvYcCVsiY7eLyiH1YHNF2K49JjzSVqpvZhhLT8z6PeKMbvDEfyzgWRbw/0dfGG5XOvLBFi1A/HWEbBpXF7+msc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwH3gMVclQWBObVlzUGrwdg+zF5htZJeYvKAVQp39weEQ+aY9SD
	GIInGSTtDCrIr1is9I3UhlF9O/iecCG2dhyjf19igqTUz5NHBpH1EKookeauhY4=
X-Google-Smtp-Source: AGHT+IFXZQD/K1TLeG6NfOcqX47mkpjTTLPrGn0buq1ncVnep+McVxEHfHC0HAl+62igUxMhH42q8A==
X-Received: by 2002:a05:600c:1c9d:b0:430:57f1:d6d with SMTP id 5b1f17b1804b1-431255d5099mr63896535e9.1.1728889465611;
        Mon, 14 Oct 2024 00:04:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d7487c4csm143659185e9.32.2024.10.14.00.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:04:24 -0700 (PDT)
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
Date: Mon, 14 Oct 2024 09:04:23 +0200
Message-ID: <172888945458.6232.12570065156992505241.b4-ty@linaro.org>
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

[3/7] gpio: aspeed: Change the macro to support deferred probe
      commit: f1bc03e7e9bbbb18ad60ad6c6908b16fb7f40545
[4/7] gpio: aspeed: Remove the name for bank array
      commit: d787289589202cd449cabed3d7fde84e18fb6dd6
[5/7] gpio: aspeed: Create llops to handle hardware access
      commit: 79fc9a2fcc457f4375118fbcdb6767163870b5ff
[6/7] dt-bindings: gpio: aspeed,ast2400-gpio: Support ast2700
      commit: bef6959a3746fc8207a0ca75e239c95d7409fd90
[7/7] gpio: aspeed: Support G7 Aspeed gpio controller
      commit: b2e861bd1eaf4c5f75139df9b75dade3334a5b6c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
