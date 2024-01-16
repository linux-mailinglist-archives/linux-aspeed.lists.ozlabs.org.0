Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D9957A06
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqL3137nz3wSs
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:58:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VaDXIcsg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDz1V5xm5z3cTF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 17 Jan 2024 06:03:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83A23CE1AD6;
	Tue, 16 Jan 2024 19:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE70C433B2;
	Tue, 16 Jan 2024 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705431802;
	bh=O97xKl3K/JtNvHQ+44OKckuR3Pp75TXib8o3WdXgsus=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VaDXIcsgPU2HcWZ7gq00FVh03mn2KgTtLHehEQ4XaZuvq9AcUZKwE/E/YIKBPnAR+
	 8JQOKTCPO/ZCvOrmI/L8S3uhC0x9GOG/35KX6GFud+O6wk83cD+hgToCSIfIq3xXvV
	 YpsuQvUfyyG3W8y5zaBmmRdWMiq4oELhjY1wvWQPSNDZL4CtVwPdO8+HJIaNg77iV8
	 G3XEEbPw9YyTJbgVbiPBWWpfaPehq85FkAcEUIpHbuTcTp5lRLF5qSOBEjtl5p/vHb
	 4FI/dNyCUUJnNpnk7hvW86QD9TjUkgES9bCkParwNUcyGr1FJ/MYPIjiqhPOh6kksL
	 Kx/fMh+u9cLOA==
Date: Tue, 16 Jan 2024 13:03:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: aspeed: System1: IBM system1 BMC board
Message-ID: <20240116190321.GA102334@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116183734.3944028-4-ninad@linux.ibm.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:27 +1000
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
Cc: festevam@denx.de, linux-aspeed@lists.ozlabs.org, andre.werner@systec-electronic.com, naresh.solanki@9elements.com, johannes.holland@infineon.com, linux-hardening@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, peterhuewe@gmx.de, patrick.rudolph@9elements.com, geert+renesas@glider.be, peteryin.openbmc@gmail.com, jgg@ziepe.ca, andrew@codeconstruct.com.au, luca.ceresoli@bootlin.com, linux@roeck-us.net, devicetree@vger.kernel.org, conor+dt@kernel.org, keescook@chromium.org, alexander.stein@ew.tq-group.com, broonie@kernel.org, lakshmiy@us.ibm.com, bhelgaas@google.com, Andrew Geissler <geissonator@yahoo.com>, linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, linux-kernel@vger.kernel.org, gpiccoli@igalia.com, jarkko@kernel.org, robh+dt@kernel.org, vincent@vtremblay.dev, linux-integrity@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jan 16, 2024 at 12:37:34PM -0600, Ninad Palsule wrote:
> From: Andrew Geissler <geissonator@yahoo.com>
> 
> Add a device tree for IBM system1 BMC board. It uses AST2600 SOC.
> - Added base board

s/Added/Add/ to match first sentence.

> - Added i2c devices and muxes.
> - Added different voltage regulators.
> - Added GPIO pin assignements, GPIO expansion devices
> - Added LED brinker devices

"brinker"?  "blinker" maybe (no idea what it actually is).

> - Added Fan controllers

s/Fan/fan/

> - Added EEPROM/VPD
> - Added Power supplies

s/Power/power/

> - Added Humidity, pressure and temperature sensors.

s/Humidity/humidity/

> - Added Trusted platform module(TPM) chip.

s/Trusted platform module/Trusted Platform Module /

> Tested:
>     This board is tested using the simics simulator.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

Your sign-off should be last since you are sending the series.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=v6.6#n396
