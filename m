Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA2616FCD
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 22:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2g7B2x96z2xkD
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 08:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oYtrJabW;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oYtrJabW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2g7572GMz2yHB
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 08:31:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCF8061C44;
	Wed,  2 Nov 2022 21:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DBAC433C1;
	Wed,  2 Nov 2022 21:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667424671;
	bh=uj1On4sityXve9n4oIzQfWoyfP20tL7E6nqXIQO6hhw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=oYtrJabWAjMaLg5J+fC3o6K0oFCrEWf26yhgKJCiSrdQtwF+TJCOjcouJBAOSzI3x
	 4fTtxtWi9RvoQAr5P5aVrzeTur9p8up8mJOvRCejPHrizZex2j4HYwGsgdawOakUhU
	 JGevFV4YUbIZOnYgsjHP8+bVNBxm4z8gTY+YoEtLoqnCk0e6AWJHVX378VaXDHEbNi
	 viPEqUpSe39UNJ4NkcCfMkTvexrizdxXxTw2PQfj/NbRXoQ1cVmcBVMRhK1vuIBt/w
	 nh+I68opL2yfL6mXlYSZ37gQkzgja4t27OiDJQdu4mqqhvJNlinU/ZSy7j1TlKqCP2
	 bkcQiGQWgh92Q==
Message-ID: <2854316e-0874-c8f7-b090-96217dd4a4e5@kernel.org>
Date: Wed, 2 Nov 2022 17:31:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [v3 1/3] dt-bindings: Add bindings for aspeed pwm-tach.
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>, jdelvare@suse.com,
 linux@roeck-us.net, robh+dt@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 lee.jones@linaro.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, p.zabel@pengutronix.de,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 BMC-SW@aspeedtech.com, garnermic@meta.com
References: <20221102083601.10456-1-billy_tsai@aspeedtech.com>
 <20221102083601.10456-2-billy_tsai@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221102083601.10456-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 02/11/2022 04:35, Billy Tsai wrote:
> This patch adds device binding for aspeed pwm-tach device which is a
> multi-function device include pwm and tach function and pwm/tach device
> bindings which should be the child-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 48 ++++++++++++
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 64 ++++++++++++++++
>  3 files changed, 188 insertions(+)

You sent several versions and still did not Cc me...

My previous feedback applies.

Best regards,
Krzysztof

