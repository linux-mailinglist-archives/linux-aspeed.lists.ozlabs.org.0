Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272EE365F7
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:49:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K19T4GZvzDqLv
	for <lists+linux-aspeed@lfdr.de>; Thu,  6 Jun 2019 06:49:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GBnc+Vxa"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K18g3dlvzDqPW
 for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Jun 2019 06:48:19 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v11so13055746pgl.5
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Du+0bbuODHKY++qb0cbQwd0FfOUyQQ1ecgU3jGLOTGg=;
 b=GBnc+VxaycEV8LoEJ1r8HyAudDX+mOEZkIjNkbqWn4+jiKHCaFAGK3s7nvzmPhASZL
 4wr4Gp4QaaYqAaTkhLRKbJkPXarMdPfzDWAQK4nqp/ZXMDKtqsayRM5VnlBYiGWaTiHO
 41Jp8E5EHr06q2z0R3qKRlchNlvxrrL/K0rVJXzhXqvEAGq+KzGARNzjOEOKKUW0OMf0
 gogNNJO4hJOpSPyt44rK2vlSI2SiBlybfnC+L7BMJvm1cPCyPCZ9hMdEYjym68Oh3qjF
 uq21T8xpRoyN6QTZ00I+jde4KZVuQlg1XYzVq0cPqmXhcyKXIFUx9vu21oV7i0hAqaJO
 InZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Du+0bbuODHKY++qb0cbQwd0FfOUyQQ1ecgU3jGLOTGg=;
 b=JPkuqdBXjRVcAQAN4r6/qVjAHtHSPZYkGfnBuLf9hw3Y9QEXCCk+K+o7nt5O6+x+Ys
 Nc1gR77cLdecjYIcLZe6OspxRyiCQ4ecF5hqpkqKLLDimO3Jk69IK0lUzQbUf6V3gKhU
 UfCuE4l06t/f3dnRIbIKdTgWPC/7NrxyjktodAgsv/XbZrXpwhnx7jQy6wE1RYz8Mxqf
 pLWdwmrcr4dCam7ZmDZGr03InIjes7p/8xOa6B6AtdFRtXK0AKlBdJyGZjYjhjY8XCOM
 CajI1+iXmKSEW78dOPhlST8ngUu+E4ySpwZ01YekPqsXsacENt2WKAapaYYWl/okGsTa
 qTtA==
X-Gm-Message-State: APjAAAVo+1RnOUKUcEybUlA+qriEthYC+JJ4VpBRGBXa7Cfmf8mWbtZW
 IOLdLhypcsi5Scr/C8w5n5E=
X-Google-Smtp-Source: APXvYqyQEyylARTcVGEVHqrWdPFSo3XEN3WJWVsYQ1m9KaMLN5RvfVM3nXPiK8CqcHgf+SRezDe/mQ==
X-Received: by 2002:a63:d008:: with SMTP id z8mr853667pgf.335.1559767694208;
 Wed, 05 Jun 2019 13:48:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v9sm20297166pfm.34.2019.06.05.13.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 13:48:13 -0700 (PDT)
Date: Wed, 5 Jun 2019 13:48:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH v2 2/2] Docs: hwmon: pmbus: Add PXE1610 driver
Message-ID: <20190605204811.GA32379@roeck-us.net>
References: <20190530231159.222188-1-vijaykhemka@fb.com>
 <20190530231159.222188-2-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530231159.222188-2-vijaykhemka@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 sdasari@fb.com, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 04:11:57PM -0700, Vijay Khemka wrote:
> Added support for Infenion PXE1610 driver
> 
Applied, after fixing
	s/Infenion/Infineon/
	s/Infinion/Infineon/

Guenter

> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
> Changes in v2:
> incorporated all the feedback from Guenter Roeck <linux@roeck-us.net>
> 
>  Documentation/hwmon/pxe1610 | 90 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/hwmon/pxe1610
> 
> diff --git a/Documentation/hwmon/pxe1610 b/Documentation/hwmon/pxe1610
> new file mode 100644
> index 000000000000..24825db8736f
> --- /dev/null
> +++ b/Documentation/hwmon/pxe1610
> @@ -0,0 +1,90 @@
> +Kernel driver pxe1610
> +=====================
> +
> +Supported chips:
> +  * Infinion PXE1610
> +    Prefix: 'pxe1610'
> +    Addresses scanned: -
> +    Datasheet: Datasheet is not publicly available.
> +
> +  * Infinion PXE1110
> +    Prefix: 'pxe1110'
> +    Addresses scanned: -
> +    Datasheet: Datasheet is not publicly available.
> +
> +  * Infinion PXM1310
> +    Prefix: 'pxm1310'
> +    Addresses scanned: -
> +    Datasheet: Datasheet is not publicly available.
> +
> +Author: Vijay Khemka <vijaykhemka@fb.com>
> +
> +
> +Description
> +-----------
> +
> +PXE1610/PXE1110 are Multi-rail/Multiphase Digital Controllers
> +and compliant to
> +	-- Intel VR13 DC-DC converter specifications.
> +	-- Intel SVID protocol.
> +Used for Vcore power regulation for Intel VR13 based microprocessors
> +	-- Servers, Workstations, and High-end desktops
> +
> +PXM1310 is a Multi-rail Controllers and it is compliant to
> +	-- Intel VR13 DC-DC converter specifications.
> +	-- Intel SVID protocol.
> +Used for DDR3/DDR4 Memory power regulation for Intel VR13 and
> +IMVP8 based systems
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not probe for PMBus devices. You will have
> +to instantiate devices explicitly.
> +
> +Example: the following commands will load the driver for an PXE1610
> +at address 0x70 on I2C bus #4:
> +
> +# modprobe pxe1610
> +# echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
> +
> +It can also be instantiated by declaring in device tree
> +
> +
> +Sysfs attributes
> +----------------
> +
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_alarm		Current high alarm
> +
> +curr[2-4]_label		"iout[1-3]"
> +curr[2-4]_input		Measured output current
> +curr[2-4]_crit		Critical maximum current
> +curr[2-4]_crit_alarm	Current critical high alarm
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_crit		Critical maximum input voltage
> +in1_crit_alarm		Input voltage critical high alarm
> +
> +in[2-4]_label		"vout[1-3]"
> +in[2-4]_input		Measured output voltage
> +in[2-4]_lcrit		Critical minimum output voltage
> +in[2-4]_lcrit_alarm	Output voltage critical low alarm
> +in[2-4]_crit		Critical maximum output voltage
> +in[2-4]_crit_alarm	Output voltage critical high alarm
> +
> +power1_label		"pin"
> +power1_input		Measured input power
> +power1_alarm		Input power high alarm
> +
> +power[2-4]_label	"pout[1-3]"
> +power[2-4]_input	Measured output power
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-3]_crit		Critical high temperature
> +temp[1-3]_crit_alarm	Chip temperature critical high alarm
> +temp[1-3]_max		Maximum temperature
> +temp[1-3]_max_alarm	Chip temperature high alarm
