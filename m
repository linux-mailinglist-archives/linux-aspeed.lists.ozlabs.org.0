Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE732EA09
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 03:05:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DqBT5brfzDqK6
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 11:05:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IPrIlAtX"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DqBL6vT7zDqHK
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 11:05:14 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id h17so945501pgv.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 18:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=beZsP/rjfL8EXcX60xBuuJ47HiagG33HBKhM1gI7z7o=;
 b=IPrIlAtXr2FDMSjX0/bzIEMw/DD91kRI7Kyd2nGYNcDCqviqF1yxJsKXacq5gSvR4M
 mBMuI9tFBSVxJtViMOKIdFfjPHDOCjrob7YTUQIobPby9v3cBSKt/FkrhY8i3ptyz54Z
 SJMLgYl/OVIWGJsq/YfN4ueGa2+iEX3UCeyVg5Jp1Tes3SZMJjw/iPyA/J1TxkwjhnTY
 XaT1Um7uoW+VB7utBeyzIeMfgNu3aQg57D5D/K+wcsh+k0nZyodje++7T7/JYXBVld/k
 +lMCKSyD7OuPJ4KapoZjFyaRryz8wNedo4iha6ZtqqF2vAeSqMW0Fi/9+N2OWe/gURNP
 QiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=beZsP/rjfL8EXcX60xBuuJ47HiagG33HBKhM1gI7z7o=;
 b=su9SCvZ9JDwHfbGF+Tmn9AiM0npQuHETf3lN5JLgo/0RRX242BfHXiPSvnSEVPRO24
 tILzJbTLsVIVuXO3FGyKvwxEO0JDZM2ii3ZHQiti3X4hqHPoexNv1nv2O9Pj31tqTiN5
 vplFtSk7atY6EWsC8RPsLxcvz+estSZS3PSKJpSoX7/yK4WL/Ge9zfxvgs5ed/3SE7a3
 RjH+OPjF6FUozr2JAgaULEuwKPc5jETOZM+IUGqsXrSc+8FHc1gEeVaFXXg7Um11MOYT
 uM+IvL6d0JVcJ1OMiePU1w+KxFRKzfl/UAzzqF53qPL6hbHowtayWgq8mcVt01gx8XGT
 zUzA==
X-Gm-Message-State: APjAAAX+XsXWSLjabKco99A1JkvTAClRUygybzuYQLwW8w1e+KmTlz75
 1SR2TRtsvX67gsdWK86gwb4=
X-Google-Smtp-Source: APXvYqwhXINGpYIe3fien1AMYupfuhGAODKoz3EA3gp4YnMJViJP2gBaJ4YnyeKQZhwk32gigQp88g==
X-Received: by 2002:a17:90a:bf0d:: with SMTP id
 c13mr675233pjs.88.1559178311313; 
 Wed, 29 May 2019 18:05:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s42sm799092pjc.5.2019.05.29.18.05.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 18:05:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] Docs: hwmon: pmbus: Add PXE1610 driver
To: Vijay Khemka <vijaykhemka@fb.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190529223511.4059120-1-vijaykhemka@fb.com>
 <20190529223511.4059120-2-vijaykhemka@fb.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0a94e784-41a0-4f2d-f9f8-6b365a1e755e@roeck-us.net>
Date: Wed, 29 May 2019 18:05:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529223511.4059120-2-vijaykhemka@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sdasari@fb.com,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 5/29/19 3:35 PM, Vijay Khemka wrote:
> Added support for Infenion PXE1610 driver
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>   Documentation/hwmon/pxe1610 | 84 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)
>   create mode 100644 Documentation/hwmon/pxe1610
> 
> diff --git a/Documentation/hwmon/pxe1610 b/Documentation/hwmon/pxe1610
> new file mode 100644
> index 000000000000..b5c83edf027a
> --- /dev/null
> +++ b/Documentation/hwmon/pxe1610
> @@ -0,0 +1,84 @@
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
> +PXE1610 is a Multi-rail/Multiphase Digital Controllers and
> +it is compliant to Intel VR13 DC-DC converter specifications.
> +

And the others ?

> +
> +Usage Notes
> +-----------
> +
> +This driver can be enabled with kernel config CONFIG_SENSORS_PXE1610
> +set to 'y' or 'm'(for module).
> +
The above does not really add value.

> +This driver does not probe for PMBus devices. You will have
> +to instantiate devices explicitly.
> +
> +Example: the following commands will load the driver for an PXE1610
> +at address 0x70 on I2C bus #4:
> +
> +# modprobe pxe1610
> +# echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
> +
> +It can also be instantiated by declaring in device tree if it is
> +built as a kernel not as a module.
> +

I assume you mean "built into the kernel".
Why would devicetree based instantiation not work if the driver is built
as module ?

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
> 

