Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E4BD28CCFAA
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 11:51:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dqWzZrD2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlNYk0LJ9z3vct
	for <lists+linux-aspeed@lfdr.de>; Thu, 23 May 2024 19:44:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dqWzZrD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 527 seconds by postgrey-1.37 at boromir; Thu, 23 May 2024 19:44:31 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlNYW2qftz3gD1;
	Thu, 23 May 2024 19:44:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716457460; x=1717062260; i=markus.elfring@web.de;
	bh=0uGdwFo2ctk4FML8FdSGhBHGQUtdWc4iJ2oydYFMsa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dqWzZrD2Re9BR7mAuoaj0DZb3LzSGQ1r/ALqJk9vgtCdV68nxGt10nPlvNfSPBQQ
	 l0dtWuqP0RlqOALe/yS8xV9vvwVHsU8Gnze1hhzy2J0DlZq1h5aMzod+jlGg9EIVg
	 XPPAjeZ41/eCCnKQKNrqjw4uf3APPWvCGxQqEP5xW7NM2L7neuuLbnz2yB9q2ePO7
	 FWps3cdoah/AZB/St/hhn7h+6pj5P9tDIgSGYVh/wVI9NUHG9zk5DZ24KgInbhaT3
	 p/driJ+6Xv/AwHrKakfdHXNkUe7pPxOsYYESaFyd0vaZ0U76p1BxMMRffkBBryp8s
	 WnZWVUDssWNTtFFRaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlsKH-1srQK80XwJ-00j1C2; Thu, 23
 May 2024 11:28:35 +0200
Message-ID: <bee0888c-f81b-46c8-8a1c-802d108dc0c0@web.de>
Date: Thu, 23 May 2024 11:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240522192524.3286237-4-eajames@linux.ibm.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: fsi: Document the IBM SCOM engine
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240522192524.3286237-4-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cfQr83D1oKR1K1NDJlowB6vfMcdr960N+SAU9f1dz0d6+hwSiTb
 MA4DYIyXKvGsh6W4yZTbt40KcDLzNPCtGhr5SbA1zZh/b53pGXMq35QTAQjVaBgs/qxHQ4K
 dSBkMwOZKquaoxw07GODYUJhnLWk/5y9wK28ZohLGzwbQbbgMVsBob90mit+EvdyO21gWYS
 zogPGGr0Cem2+krxYe2Sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7HtMtDbzxJY=;JwXsrg0JfVCAflHNY4kR/dll9Mr
 /Lul+xHbV2Vah9PrQ96V7/n5o5Y+CY4716u6XDbPtebze+bi7dRuaYB36m3TuQJ1UJaVa1OW0
 C+QyGYPDO50gRgRysz7MTilOeAO61wH5HOkDHsSK05hg+HpsZYRUWNlvHT9Vm6+jGM9nq6Ujx
 zSMODwFfeI8NyGpmApWBSfNDIQTYlqsT/6r3D12xBSEXtiJQT3z6OaSGw75UxzOiZTntvY6Np
 EkvqpSHOdU0xJDQ+rUz9sx+9NiYLh81QdbwmPcIEB4HIoNcuBVsa2KL/LRCyW/ZOY2k4tDkPz
 NyNelSvs1zTCdgtopLrvboWMARsGOCQf13MPVwUCMam6qRWGNykKYy88IBN0oP9obRVhLyMXx
 llyoyeWriYuupVzSj9pUYj90khXo05pg4lQkkRKmfvvVSm3G6GHle72RxD4wl8O5zpmWI0wCJ
 z/vhzUzFbl00xg+Y/hHqgvhilfV4CJRsIZi5lfxa4kaRk20lGiqLblJQg9fjv6y8YB2ITn8J7
 /aIhgLCXgBCYNi0FA6XmbK4EvGtbCAjRTvyiCjnQj63nFLzhcgD5IEClZmt/jLs5kWAnKdhkp
 J9ExFd8FsL6WarXN/xxzQeZ3bNdpLV+HhQGVxh6uC+k133h6Cl7UFq5r2iqMDhU81DHd75Vvg
 tnbsuFIw8ma5QZN5WFfajrh2bxoaLHpe5ITX/VOhAlivg8YZb2me0hFQE9+nODi/SYMiFHvWO
 v87wcvPsx6k+zJ/8mrIocIVIYI0b6MiT2Q330MY7Gen4EK/WN/2wt7DcVOl5CwWZyGqRJ+WRR
 LKvRPVyLaU4/7HIeCyCgmycruS20DWbTaxMz/fvoul5YQ=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> The SCOM engine provides an interface to the POWER processor PIB
> (Pervasive Interconnect Bus).

Please improve this change description with a corresponding imperative wording.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94

Regards,
Markus
