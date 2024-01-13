Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4EA82C8F8
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Jan 2024 02:55:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pSHypRh9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBhLY48lLz3bXw
	for <lists+linux-aspeed@lfdr.de>; Sat, 13 Jan 2024 12:55:17 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pSHypRh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBhLQ3npwz30XZ
	for <linux-aspeed@lists.ozlabs.org>; Sat, 13 Jan 2024 12:55:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF4F5CE2565;
	Sat, 13 Jan 2024 01:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE772C433C7;
	Sat, 13 Jan 2024 01:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705110906;
	bh=GkBYE0muoV9iImDlwTh/2HjyqMO1Yeic9Ipvx+EyJSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSHypRh9cOxsCSMUXWjCHskAINRqbTXYy1sbUHtyNEhkc/J6uMauCh3wXd/nCjePr
	 yv+ESXPBn3phmwyqcNKfl3fHEG0s76V1EM4IPpG5uLdzwLiTCczbusQxdzLnQZtgR1
	 BWSSt3oKLa4DPl5mffsyyRWOAuLwm+2SfVgIfVG7mqOvIiJb1APxz9rfSMUkuP8KKH
	 N+CKoVQSti/vnaypgiEnu/GoN5oKyf2auhPunkL45R+FlV4kmKSwmMO+CjU5rRt39B
	 5XDsWkpSEkXmAMF4Pi/4uMoYl1BGxeOwjqG8wZTReAyEv7v1Pg1ASmYbkPfOJpEvsc
	 GfmUbaRhbRdww==
Date: Fri, 12 Jan 2024 19:55:03 -0600
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: hwmon: fan: Add fan binding to
 schema
Message-ID: <170511090309.3829370.10710486836364106581.robh@kernel.org>
References: <20240108074348.735014-1-billy_tsai@aspeedtech.com>
 <20240108074348.735014-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108074348.735014-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, BMC-SW@aspeedtech.com, jdelvare@suse.com, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, devicetree@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Mon, 08 Jan 2024 15:43:46 +0800, Billy Tsai wrote:
> From: Naresh Solanki <naresh.solanki@9elements.com>
> 
> Add common fan properties bindings to a schema.
> 
> Bindings for fan controllers can reference the common schema for the
> fan
> 
> child nodes:
> 
>   patternProperties:
>     "^fan@[0-2]":
>       type: object
>       $ref: fan-common.yaml#
>       unevaluatedProperties: false
> 
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/hwmon/fan-common.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

