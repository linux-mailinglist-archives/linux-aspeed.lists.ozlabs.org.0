Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D72FE74
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 16:52:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F9XN3rhjzDqV9
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 00:52:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nwpj6KLLzDqHW
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Apr 2019 04:58:52 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3MIsPeH023009
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Apr 2019 14:58:50 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s1fxj9sd1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Apr 2019 14:58:49 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-aspeed@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Mon, 22 Apr 2019 19:58:48 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 22 Apr 2019 19:58:45 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3MIwiO924903698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Apr 2019 18:58:44 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72DB8124052;
 Mon, 22 Apr 2019 18:58:44 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A291124058;
 Mon, 22 Apr 2019 18:58:44 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 22 Apr 2019 18:58:44 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v2] ARM: dts: aspeed: Add Swift BMC machine
To: Adriana Kobylak <anoo@linux.ibm.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
References: <02b66794-19bf-a042-66a9-00fc712355f5@linux.ibm.com>
 <1555605815-31386-1-git-send-email-anoo@linux.ibm.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Mon, 22 Apr 2019 13:58:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555605815-31386-1-git-send-email-anoo@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19042218-0072-0000-0000-0000041D271B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010975; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01192867; UDB=6.00625282; IPR=6.00973684; 
 MB=3.00026546; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-22 18:58:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042218-0073-0000-0000-00004BEB821B
Message-Id: <5bbc8649-5a38-fe38-9a97-9c4ec582b511@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904220142
X-Mailman-Approved-At: Fri, 31 May 2019 00:50:56 +1000
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On 4/18/2019 11:43 AM, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The Swift BMC is an ASPEED ast2500 based BMC that is part of
> a Power9 server. This adds the device tree description for
> most upstream components.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>   arch/arm/boot/dts/Makefile                 |   1 +
>   arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 782 +++++++++++++++++++++++++++++
>   2 files changed, 783 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148..b82a24d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1244,6 +1244,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-opp-lanyang.dtb \
>   	aspeed-bmc-opp-palmetto.dtb \
>   	aspeed-bmc-opp-romulus.dtb \
> +	aspeed-bmc-opp-swift.dtb \
>   	aspeed-bmc-opp-witherspoon.dtb \
>   	aspeed-bmc-opp-zaius.dtb \
>   	aspeed-bmc-portwell-neptune.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> new file mode 100644
> index 0000000..1921a50
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -0,0 +1,782 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/leds/leds-pca955x.h>
> +
> +/ {
> +	model = "Swift BMC";
> +	compatible = "ibm,swift-bmc", "aspeed,ast2500";
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory@80000000 {
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		flash_memory: region@98000000 {
> +			no-map;
> +			reg = <0x98000000 0x04000000>; /* 64M */
> +		};
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		air-water {
> +			label = "air-water";
> +			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(B, 5)>;
> +		};
> +
> +		checkstop {
> +			label = "checkstop";
> +			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(J, 2)>;
> +		};
> +
> +		ps0-presence {
> +			label = "ps0-presence";
> +			gpios = <&gpio ASPEED_GPIO(R, 7) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(R, 7)>;
> +		};
> +
> +		ps1-presence {
> +			label = "ps1-presence";
> +			gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
> +			linux,code = <ASPEED_GPIO(N, 0)>;
> +		};


Can you also add the entries for the op-panel and CAPI riser presence 
detects?


> +	};
> +
> +	iio-hwmon-battery {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc 12>;
> +	};
> +
> +	gpio-keys-polled {
> +		compatible = "gpio-keys-polled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		poll-interval = <1000>;
> +


The SCM and VRM presence detects from the pca9552 on bus 8 below

I think we also want listed here?


> +		fan0-presence {
> +			label = "fan0-presence";
> +			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +			linux,code = <5>;
> +		};
> +
> +		fan1-presence {
> +			label = "fan1-presence";
> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <6>;
> +		};
> +
> +		fan2-presence {
> +			label = "fan2-presence";
> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <7>;
> +		};
> +
> +		fan3-presence {
> +			label = "fan3-presence";
> +			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
> +			linux,code = <8>;
> +		};
> +
> +		fanboost-presence {
> +			label = "fanboost-presence";
> +			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
> +			linux,code = <9>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		fan0 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fan1 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fan2 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fan3 {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		fanboost {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		front-fault {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		front-power {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		front-id {
> +			retain-state-shutdown;
> +			default-state = "keep";
> +			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		rear-fault {
> +			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		rear-id {
> +			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
> +		};
> +
> +		rear-power {
> +			gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	fsi: gpio-fsi {
> +		compatible = "fsi-master-gpio", "fsi-master";
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +		no-gpio-delays;
> +
> +		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> +		mux-gpios = <&gpio ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
> +		enable-gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
> +		trans-gpios = <&gpio ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	iio-hwmon-dps310 {
> +		compatible = "iio-hwmon";
> +		io-channels = <&dps 0>;
> +	};
> +
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <100000000>;
> +		partitions {
> +			#address-cells = < 1 >;
> +			#size-cells = < 1 >;
> +			compatible = "fixed-partitions";
> +			u-boot@0 {
> +				reg = < 0 0x60000 >;
> +				label = "u-boot";
> +			};
> +			u-boot-env@60000 {
> +				reg = < 0x60000 0x20000 >;
> +				label = "u-boot-env";
> +			};
> +			obmc-ubi@80000 {
> +				reg = < 0x80000 0x7F80000>;
> +				label = "obmc-ubi";
> +			};
> +		};
> +	};
> +
> +	flash@1 {
> +		status = "okay";
> +		label = "alt-bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <100000000>;
> +		partitions {
> +			#address-cells = < 1 >;
> +			#size-cells = < 1 >;
> +			compatible = "fixed-partitions";
> +			u-boot@0 {
> +				reg = < 0 0x60000 >;
> +				label = "alt-u-boot";
> +			};
> +			u-boot-env@60000 {
> +				reg = < 0x60000 0x20000 >;
> +				label = "alt-u-boot-env";
> +			};
> +			obmc-ubi@80000 {
> +				reg = < 0x80000 0x7F80000>;
> +				label = "alt-obmc-ubi";
> +			};
> +		};
> +	};
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		label = "pnor";
> +		m25p,fast-read;
> +		spi-max-frequency = <100000000>;
> +	};
> +};
> +
> +&uart1 {
> +	/* Rear RS-232 connector */
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd1_default
> +			&pinctrl_rxd1_default
> +			&pinctrl_nrts1_default
> +			&pinctrl_ndtr1_default
> +			&pinctrl_ndsr1_default
> +			&pinctrl_ncts1_default
> +			&pinctrl_ndcd1_default
> +			&pinctrl_nri1_default>;
> +};
> +
> +&uart2 {
> +	/* APSS */
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&lpc_ctrl {
> +	status = "okay";
> +	memory-region = <&flash_memory>;
> +	flash = <&spi1>;
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +	use-ncsi;
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	/* MUX ->
> +	 *    Samtec 1
> +	 *    Samtec 2
> +	 */
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	max31785@52 {
> +		compatible = "maxim,max31785a";
> +		reg = <0x52>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		fan@0 {
> +			compatible = "pmbus-fan";
> +			reg = <0>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@1 {
> +			compatible = "pmbus-fan";
> +			reg = <1>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@2 {
> +			compatible = "pmbus-fan";
> +			reg = <2>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@3 {
> +			compatible = "pmbus-fan";
> +			reg = <3>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +
> +		fan@4 {
> +			compatible = "pmbus-fan";
> +			reg = <4>;
> +			tach-pulses = <2>;
> +			maxim,fan-rotor-input = "tach";
> +			maxim,fan-pwm-freq = <25000>;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp = <2>;
> +			maxim,fan-fault-pin-mon;
> +		};
> +	};
> +
> +	pca0: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +	};
> +
> +	power-supply@68 {
> +		compatible = "ibm,cffps1";
> +		reg = <0x68>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};
> +
> +	power-supply@69 {
> +		compatible = "ibm,cffps1";
> +		reg = <0x69>;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +	};
> +};
> +
> +&i2c7 {
> +	status = "okay";
> +
> +	dps: dps310@76 {
> +		compatible = "infineon,dps310";
> +		reg = <0x76>;
> +		#io-channel-cells = <0>;
> +	};
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	si7021a20@20 {
> +		compatible = "si,si7021a20";
> +		reg = <0x20>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c64";
> +		reg = <0x50>;
> +	};
> +
> +	pca1: pca9551@60 {
> +		compatible = "nxp,pca9551";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +	};
> +};
> +
> +&i2c8 {
> +	status = "okay";
> +
> +	pca9552: pca9552@60 {
> +		compatible = "nxp,pca9552";
> +		reg = <0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
> +			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
> +			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
> +			"P9_SCM0_PRES",	"P9_SCM1_PRES",
> +			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
> +			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
> +			"PRESENT_VRM_CP0_N", "PRESENT_VRM_CP1_N",
> +			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
> +
> +		gpio@0 {
> +			reg = <0>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@1 {
> +			reg = <1>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@2 {
> +			reg = <2>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@3 {
> +			reg = <3>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@4 {
> +			reg = <4>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@5 {
> +			reg = <5>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@6 {
> +			reg = <6>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@7 {
> +			reg = <7>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@8 {
> +			reg = <8>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@9 {
> +			reg = <9>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@10 {
> +			reg = <10>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@11 {
> +			reg = <11>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@12 {
> +			reg = <12>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@13 {
> +			reg = <13>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@14 {
> +			reg = <14>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +
> +		gpio@15 {
> +			reg = <15>;
> +			type = <PCA955X_TYPE_GPIO>;
> +		};
> +	};
> +
> +	rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c64";
> +		reg = <0x51>;
> +	};
> +
> +	ucd90160@64 {
> +		compatible = "ti,ucd90160";
> +		reg = <0x64>;
> +	};
> +};
> +
> +&i2c9 {
> +	status = "okay";
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	ir35221@71 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x71>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};


Can you add the EEPROM for this CPU0 VRM here?


> +};
> +
> +&i2c10 {
> +	status = "okay";
> +
> +	tmp423a@4c {
> +		compatible = "ti,tmp423";
> +		reg = <0x4c>;
> +	};
> +
> +	ir35221@71 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x71>;
> +	};
> +
> +	ir35221@72 {
> +		compatible = "infineon,ir35221";
> +		reg = <0x72>;
> +	};


Can you add the EEPROM for this CPU1 VRM here?


> +};
> +
> +&i2c11 {
> +	/* MUX
> +	 *   -> PCIe Slot 0
> +	 *   -> PCIe Slot 1
> +	 *   -> PCIe Slot 2
> +	 *   -> PCIe Slot 3
> +	 */
> +	status = "okay";
> +};
> +
> +&i2c12 {
> +	status = "okay";
> +
> +	tmp275@48 {
> +		compatible = "ti,tmp275";
> +		reg = <0x48>;
> +	};
> +
> +	tmp275@4a {
> +		compatible = "ti,tmp275";
> +		reg = <0x4a>;
> +	};
> +};
> +
> +&i2c13 {
> +	status = "okay";
> +};
> +
> +&vuart {
> +	status = "okay";
> +};
> +
> +&gfx {
> +	status = "okay";
> +	memory-region = <&gfx_memory>;
> +};
> +
> +&pinctrl {
> +	aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&wdt1 {
> +	aspeed,reset-type = "none";
> +	aspeed,external-signal;
> +	aspeed,ext-push-pull;
> +	aspeed,ext-active-high;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdtrst1_default>;
> +};
> +
> +&wdt2 {
> +	aspeed,alt-boot;
> +};
> +
> +&ibt {
> +	status = "okay";
> +};
> +
> +&adc {
> +	status = "okay";
> +};
> +
> +#include "ibm-power9-dual.dtsi"

