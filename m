Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088292A401
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 15:47:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YJmTuOFz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHlmx2Xhfz3cVH
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jul 2024 23:47:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YJmTuOFz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHlml6cHvz301T;
	Mon,  8 Jul 2024 23:47:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51014CE0BAE;
	Mon,  8 Jul 2024 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E71C116B1;
	Mon,  8 Jul 2024 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720446451;
	bh=7hu3e9/Hj8XC7xexm2FHFjZJcixRqYd55unsbK3uK94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJmTuOFz9YUaZVvSbeZHVgmn99MOvvOkPPiu3F3d7+5/m5qwDzOZPIyuVKx4O3U1p
	 1FfRqxlNExaCIF0AtJa8O8k8vDj4tqtbl/7XsHVFb8iuTuGwXU50sMnr/skst8U8Vs
	 TMuSFeqpmtLZZ+nFYW7bh2UrvJXdFnyUaHV4PQKhhuZxD38t2kmzvfFrWjIQ2HPimE
	 CQGsCDfOF7yWoRatQHQByGWHGUerIz+V1thfMUIFmJhwJK+k9Ujnun0xRrnU5KByBr
	 UUA7ivjC8UF8z4BtLu8yQnTNVwlZKOyi9I+ge5s6ZnR4YU88xqTXFsY8vRw2kGgY4r
	 LOKXviKqq9olw==
Date: Mon, 8 Jul 2024 07:47:30 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v6 00/20] ARM: dts: aspeed: Add IBM P11 BMC systems
Message-ID: <20240708134730.GA2916637-robh@kernel.org>
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522192524.3286237-1-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, May 22, 2024 at 02:25:04PM -0500, Eddie James wrote:
> Add the Blueridge and Fuji BMC systems. Document many missing FSI related
> properties, and fix existing warnings. Make some minor fixes in OCC and
> SCOM drivers for the updated bindings.
> 
> Changes since v5:
>  - Switch from clock-frequency to bus-frequency for common FSI controller
>    properties
>  - Add reg properties for AST2700 FSI controller
>  - Fix patternProperties for i2c bus nodes under FSI-based I2C controller
>  - Add bus-frequency for P11 FSI device tree node
>  - Change model name from Blueridge to Blueridge 2U
>  - Add missing reset gpio to led controller on Fuji
>  - Add Huygens (Rainier with modified FSI wiring)
> 
> Eddie James (20):
>   spi: dt-bindings: Document the IBM FSI-attached SPI controller
>   dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
>   dt-bindings: fsi: Document the IBM SCOM engine
>   dt-bindings: fsi: p9-occ: Convert to json-schema
>   dt-bindings: fsi: Document the IBM SBEFIFO engine
>   dt-bindings: fsi: Document the FSI controller common properties
>   dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
>   dt-bindings: fsi: ast2600-fsi-master: Convert to json-schema
>   dt-bindings: fsi: Document the AST2700 FSI controller
>   dt-bindings: fsi: Document the FSI Hub Controller
>   dt-bindings: i2c: i2c-fsi: Convert to json-schema

Looks like these haven't been applied, so I applied patches 2-11.

>   dt-bindings: arm: aspeed: add IBM P11 BMC boards
>   ARM: dts: aspeed: Add IBM P11 FSI devices
>   ARM: dts: aspeed: Add IBM P11 Blueridge BMC system
>   ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC system
>   ARM: dts: aspeed: Add IBM P11 Fuji BMC system
>   ARM: dts: aspeed: Add IBM Huygens BMC system
>   fsi: occ: Get device number from FSI minor number API
>   fsi: occ: Find next available child rather than node name match
>   fsi: scom: Update compatible string to match documentation
