Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB637302F9
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 21:44:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FJ2J2jCzzDqWv
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 05:44:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FM2OEZ3G"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FJ292SHgzDqSf
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 05:44:47 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t1so2612166pgc.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tOkGideby907RBtrOIjKle7GZBE1u6kzscwpZUYpKE0=;
 b=FM2OEZ3GN3bwNq1UjsqaHSfsg8kVmwOrMQr85ikKO6MpKDq0NEkl/yLcklBww55W+/
 C63OZSgCvfsKPmVGNt2edCIw0QDwo2BrgAFIikNPrxvw9HJPoEsZgajMoBeanLhWoWzx
 EWiGa46rv/V2aWL6R9hqdddKY9nUJL4BHp1P6shOpcyUIesmyNcxzU/4FxpJ905CgP6K
 bqUT2/gjzAuwXiZx2gnwE6fLyTQcH8zaJYZOL6i4h3ZDEu94KQcPCbvTxLJ8dISf+P0l
 AO6gppFdP6Eq+wUIf0ut7mt2B9nyisLdbf41uNF+9GtTs2eLNraHTF7VRQg9NwmyMWMe
 7UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=tOkGideby907RBtrOIjKle7GZBE1u6kzscwpZUYpKE0=;
 b=QFZSYEqNh31v8DJfLzkWoEEGgYpPqFQ1VeNtOMJqQPuqYdyNZrIr0kt3FCVAMa4o4X
 qYmb1qqod95eEEpG0QAt9iWhheaN7JXx/ST28tczTvStmrncXluCK5XoS5379bgW9dSb
 GaDTs8sQ4vUZ3zsK0Q0IwEHBOFhsUzY2ofGSRKHmWDLA2Lc9FUjS/SGHRl8X+Qcpy9rR
 mxKmNcoDRQuMzn8CCzr5mibPw3OFmgcSC8nQJE3gzrbFSuV8RE+G/4rRHRQrl8QeaJZs
 ylGiIhykcdL5cMqDDc8cU6TusvpbVL0/wnCn2mLq8GVqReFiTExJZMCmG9QsrnqIa9HY
 O8KA==
X-Gm-Message-State: APjAAAVpV/tXgwCyV1TWpDBlj9GqtgYRuXdLKbAKXp0FNWvKsmGnsLab
 SRtOD93adCraYMGTHrQSbt8=
X-Google-Smtp-Source: APXvYqys70QmfcLwxIVpRc0z43hTv7qliHdF9a1qGGNteQ6F/7/vyvccDlhpWdOZWagbjgPXIuw7gg==
X-Received: by 2002:a17:90a:aa0d:: with SMTP id
 k13mr4784425pjq.53.1559245483769; 
 Thu, 30 May 2019 12:44:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id j20sm1374443pff.183.2019.05.30.12.44.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 12:44:42 -0700 (PDT)
Date: Thu, 30 May 2019 12:44:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH 2/2] Docs: hwmon: pmbus: Add PXE1610 driver
Message-ID: <20190530194441.GA12310@roeck-us.net>
References: <20190529223511.4059120-1-vijaykhemka@fb.com>
 <20190529223511.4059120-2-vijaykhemka@fb.com>
 <0a94e784-41a0-4f2d-f9f8-6b365a1e755e@roeck-us.net>
 <27E78CF3-FAE7-4B6F-ABD7-77F4AE1CD633@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27E78CF3-FAE7-4B6F-ABD7-77F4AE1CD633@fb.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Sai Dasari <sdasari@fb.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 06:51:52PM +0000, Vijay Khemka wrote:
> 
> 
> ﻿On 5/29/19, 6:05 PM, "Guenter Roeck" <groeck7@gmail.com on behalf of linux@roeck-us.net> wrote:
> 
>     On 5/29/19 3:35 PM, Vijay Khemka wrote:
>     > Added support for Infenion PXE1610 driver
>     > 
>     > Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
>     > ---
>     >   Documentation/hwmon/pxe1610 | 84 +++++++++++++++++++++++++++++++++++++
>     >   1 file changed, 84 insertions(+)
>     >   create mode 100644 Documentation/hwmon/pxe1610
>     > 
>     > diff --git a/Documentation/hwmon/pxe1610 b/Documentation/hwmon/pxe1610
>     > new file mode 100644
>     > index 000000000000..b5c83edf027a
>     > --- /dev/null
>     > +++ b/Documentation/hwmon/pxe1610
>     > @@ -0,0 +1,84 @@
>     > +Kernel driver pxe1610
>     > +=====================
>     > +
>     > +Supported chips:
>     > +  * Infinion PXE1610
>     > +    Prefix: 'pxe1610'
>     > +    Addresses scanned: -
>     > +    Datasheet: Datasheet is not publicly available.
>     > +
>     > +  * Infinion PXE1110
>     > +    Prefix: 'pxe1110'
>     > +    Addresses scanned: -
>     > +    Datasheet: Datasheet is not publicly available.
>     > +
>     > +  * Infinion PXM1310
>     > +    Prefix: 'pxm1310'
>     > +    Addresses scanned: -
>     > +    Datasheet: Datasheet is not publicly available.
>     > +
>     > +Author: Vijay Khemka <vijaykhemka@fb.com>
>     > +
>     > +
>     > +Description
>     > +-----------
>     > +
>     > +PXE1610 is a Multi-rail/Multiphase Digital Controllers and
>     > +it is compliant to Intel VR13 DC-DC converter specifications.
>     > +
>     
>     And the others ?
> This supports VR12 as well and I don't see this controller supports any other VR versions.
>     
The point here is that there is no description of the other controllers.

>     > +
>     > +Usage Notes
>     > +-----------
>     > +
>     > +This driver can be enabled with kernel config CONFIG_SENSORS_PXE1610
>     > +set to 'y' or 'm'(for module).
>     > +
>     The above does not really add value.
> Ok, I will remove it.
>     
>     > +This driver does not probe for PMBus devices. You will have
>     > +to instantiate devices explicitly.
>     > +
>     > +Example: the following commands will load the driver for an PXE1610
>     > +at address 0x70 on I2C bus #4:
>     > +
>     > +# modprobe pxe1610
>     > +# echo pxe1610 0x70 > /sys/bus/i2c/devices/i2c-4/new_device
>     > +
>     > +It can also be instantiated by declaring in device tree if it is
>     > +built as a kernel not as a module.
>     > +
>     
>     I assume you mean "built into the kernel".
>     Why would devicetree based instantiation not work if the driver is built
>     as module ?
> Will correct statement here.
>     
>     > +
>     > +Sysfs attributes
>     > +----------------
>     > +
>     > +curr1_label		"iin"
>     > +curr1_input		Measured input current
>     > +curr1_alarm		Current high alarm
>     > +
>     > +curr[2-4]_label		"iout[1-3]"
>     > +curr[2-4]_input		Measured output current
>     > +curr[2-4]_crit		Critical maximum current
>     > +curr[2-4]_crit_alarm	Current critical high alarm
>     > +
>     > +in1_label		"vin"
>     > +in1_input		Measured input voltage
>     > +in1_crit		Critical maximum input voltage
>     > +in1_crit_alarm		Input voltage critical high alarm
>     > +
>     > +in[2-4]_label		"vout[1-3]"
>     > +in[2-4]_input		Measured output voltage
>     > +in[2-4]_lcrit		Critical minimum output voltage
>     > +in[2-4]_lcrit_alarm	Output voltage critical low alarm
>     > +in[2-4]_crit		Critical maximum output voltage
>     > +in[2-4]_crit_alarm	Output voltage critical high alarm
>     > +
>     > +power1_label		"pin"
>     > +power1_input		Measured input power
>     > +power1_alarm		Input power high alarm
>     > +
>     > +power[2-4]_label	"pout[1-3]"
>     > +power[2-4]_input	Measured output power
>     > +
>     > +temp[1-3]_input		Measured temperature
>     > +temp[1-3]_crit		Critical high temperature
>     > +temp[1-3]_crit_alarm	Chip temperature critical high alarm
>     > +temp[1-3]_max		Maximum temperature
>     > +temp[1-3]_max_alarm	Chip temperature high alarm
>     > 
>     
>     
> 
