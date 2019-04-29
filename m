Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49EE868
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:09:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB2v3ZYYzDqTL
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:09:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="C3TvIbUV"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB244XCWzDqSr
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:08:28 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id h18so8437002lfj.11
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BwIJ9jvJjTPtmIuNUi+jzS5O1ffE19llaBGI2OHGpyA=;
 b=C3TvIbUV2AijVn5AwG6jRxwbopqcktl4R+7ospfgsMnnUWs6RMrReD1E7e4xF/ay57
 lIftkCeL4D+LjT249H6ib9HRra9Wg1UYBWeE209CRRRR7/KFkqhw0JAabguc/yUVw8b7
 XzOa/gGBCSYKg9GoEEdSfOEHeobtvQHN2XJq2A263aHcT9gK6pt+n0E7YrE6U+6LchDU
 A1T/BF5Om+L7YXRMIEwOiU475snjLoY2N8GGvd07MbLHMr0x7gSGnUwuXqVlJVrRRUTO
 JzyzGJF4Kf2ct2IKIuPbP3Bh2YYtp0Xjr32hgyWNd4P2VjnHWhN2YByrJltOS1TZkmut
 l0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BwIJ9jvJjTPtmIuNUi+jzS5O1ffE19llaBGI2OHGpyA=;
 b=giwhLLOc7pIC9qrwgLqSKVGHtfyMjP0Wu+zEd0Q01dvET3uaIslXnhS1HzieyXV/74
 Dbnz9bb4QUW6VL12DpF7qAYgBZRjajVFPMvseAbKJX/ie0UY9vQuTwaSEZ8rX3DbKlMs
 /qh8iheD/ujpudXo7ocntMPuanPoKraU7Mp7FbMTQ/KXjMVQwAZL2RrFUcLBRWyD3hvk
 zAOqxV9Hn9VM9W+R1wVmq3lEguIyrKN9ZVCCWNtpz38iAQyi349L6lu481QxdfqVLyeY
 3c/vCmdCPD1LKKOishpiyhVYSfYBrPv/k5LeUIt/O2dWNNNOrzSRwo1+RbdVTMFTEkly
 j1KA==
X-Gm-Message-State: APjAAAWbTqjRUBPSKNlkRgGCZEUG+wrB7y8pMPH9o6jDJ0Aq7U8MMsDn
 0cnNUN5WbTbJ9CdxDRDHpMDXaw==
X-Google-Smtp-Source: APXvYqy5qf0XrSG7O2GG1ImVUzHdDiyIR/8Jj398WH2fEnvqatsTeaX+zp2kBDUyUvQDzXXXygPHZw==
X-Received: by 2002:a19:ee17:: with SMTP id g23mr33952790lfb.43.1556557704787; 
 Mon, 29 Apr 2019 10:08:24 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id c17sm5330056lff.84.2019.04.29.10.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 10:08:23 -0700 (PDT)
Date: Mon, 29 Apr 2019 10:05:40 -0700
From: Olof Johansson <olof@lixom.net>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: Add aspeed-p2a-ctrl node
Message-ID: <20190429170540.27bc3fu6nvab2vc5@localhost>
References: <20190425194853.140617-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425194853.140617-1-venture@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arm@kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 25, 2019 at 12:48:53PM -0700, Patrick Venture wrote:
> Add a node for the aspeed-p2a-ctrl module.  This node, when enabled will
> disable the PCI-to-AHB bridge and then allow control of this bridge via
> ioctls, and access via mmap.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Patrick,

Please send these to Joel and Andrew (and cc the mailing lists). No need to
send patches that there are active maintainers for to arm@kernel.org directly.

(As a matter of fact, drivers/soc/aspeed should go through them too, even if
I applied the first patch directly just now).


-Olof
